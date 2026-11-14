import { PrismaClient } from "@prisma/client";
import ExcelJS from "exceljs";

const prisma = new PrismaClient();

const FILE = process.argv[2];
if (!FILE) {
  console.error("Usage: npx tsx scripts/import-backup-xlsx.ts <file.xlsx>");
  process.exit(1);
}

const COMPANY_NAME = process.env.IMPORT_COMPANY_NAME ?? "Ladang Subur Makmur";

function parseValue(v: unknown): unknown {
  if (v === null || v === undefined) return null;
  if (typeof v === "number" || typeof v === "boolean") return v;
  if (v instanceof Date) return v;
  let s = String(v);
  if (s.startsWith('"') && s.endsWith('"')) s = s.slice(1, -1);
  if (s === "Ya") return true;
  if (s === "Tidak") return false;
  if (/^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}$/.test(s)) return new Date(s.replace(" ", "T") + "Z");
  if (/^\d{4}-\d{2}-\d{2}$/.test(s)) return new Date(s + "T00:00:00Z");
  if (/^-?\d+(\.\d+)?$/.test(s)) return Number(s);
  return s;
}

type SheetDef = {
  sheet: string;
  model: string;
  companyScoped: boolean;
};

const SHEETS: SheetDef[] = [
  { sheet: "Jabatan", model: "jabatan", companyScoped: false },
  { sheet: "Kegiatan", model: "kegiatan", companyScoped: false },
  { sheet: "KegiatanPerawatan", model: "kegiatanPerawatan", companyScoped: false },
  { sheet: "JenisPupuk", model: "jenisPupuk", companyScoped: false },
  { sheet: "Kebun", model: "kebun", companyScoped: true },
  { sheet: "Afdeling", model: "afdeling", companyScoped: true },
  { sheet: "Blok", model: "blok", companyScoped: true },
  { sheet: "Pekerja", model: "pekerja", companyScoped: true },
  { sheet: "Barang", model: "barang", companyScoped: true },
  { sheet: "WorkCalendar", model: "workCalendar", companyScoped: true },
  { sheet: "BudgetProduksi", model: "budgetProduksiBulanan", companyScoped: true },
  { sheet: "AbsensiHarian", model: "absensiHarian", companyScoped: true },
  { sheet: "AbsensiItem", model: "absensiItem", companyScoped: true },
  { sheet: "PanenBlok", model: "panenBlok", companyScoped: true },
  { sheet: "PerawatanBlok", model: "perawatanBlok", companyScoped: true },
  { sheet: "PemupukanBlok", model: "pemupukanBlok", companyScoped: true },
  { sheet: "Penugasan", model: "penugasan", companyScoped: true },
  { sheet: "TransaksiGudang", model: "transaksiGudang", companyScoped: true },
];

async function main() {
  const company = await prisma.company.findFirst({ where: { nama: COMPANY_NAME } });
  if (!company) {
    console.error(`Company "${COMPANY_NAME}" tidak ditemukan.`);
    process.exit(1);
  }
  console.log(`Company target: ${company.nama} (${company.id})`);

  const globals = ["jabatan", "kegiatan", "kegiatanPerawatan", "jenisPupuk"];
  for (const g of globals) {
    await (prisma as unknown as Record<string, { deleteMany: () => Promise<unknown> }>)[g].deleteMany();
  }
  console.log("Global master data (seed) dibersihkan.");

  const wb = new ExcelJS.Workbook();
  await wb.xlsx.readFile(FILE);

  for (const def of SHEETS) {
    const ws = wb.getWorksheet(def.sheet);
    if (!ws) continue;

    const headers: string[] = [];
    ws.getRow(1).eachCell((cell, col) => {
      headers[col - 1] = String(cell.value ?? "").trim();
    });

    const rows: Record<string, unknown>[] = [];
    for (let r = 2; r <= ws.rowCount; r++) {
      const rec: Record<string, unknown> = {};
      let empty = true;
      headers.forEach((h, i) => {
        if (!h) return;
        const v = ws.getRow(r).getCell(i + 1).value;
        if (v !== null && v !== undefined && String(v).trim() !== "" && String(v) !== "(no data)") {
          empty = false;
        }
        rec[h] = parseValue(v);
      });
      if (empty) continue;
      rows.push(rec);
    }

    if (rows.length === 0) {
      console.log(`- ${def.sheet}: kosong`);
      continue;
    }

    const mapped = rows.map((d) => {
      const o: Record<string, unknown> = {};
      for (const [k, v] of Object.entries(d)) {
        o[k] = def.companyScoped && k === "companyId" ? company.id : v;
      }
      return o;
    });

    const res = await (prisma as unknown as Record<string, { createMany: (args: { data: unknown[]; skipDuplicates?: boolean }) => Promise<{ count: number }> }>)[
      def.model
    ].createMany({ data: mapped, skipDuplicates: true });

    console.log(`- ${def.sheet}: ${res.count}/${rows.length} baris`);
  }

  console.log("Selesai.");
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
