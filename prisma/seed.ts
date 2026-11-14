import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";

const prisma = new PrismaClient();

async function main() {
  const email = "sawitreport@gmail.com";
  const password = "SawitReport#2025";
  const pin = "123456";
  const pinMaster = "111111";
  const pinInput = "222222";
  const pinReport = "333333";

  const passwordHash = await bcrypt.hash(password, 12);
  const pinHash = await bcrypt.hash(pin, 12);
  const pinMasterHash = await bcrypt.hash(pinMaster, 12);
  const pinInputHash = await bcrypt.hash(pinInput, 12);
  const pinReportHash = await bcrypt.hash(pinReport, 12);

  const company = await prisma.company.create({
    data: {
      nama: "Ladang Subur Makmur",
      email: "didik.suntoro@gmail.com",
      phone: "085252616110",
      paket: "PREMIUM",
    },
  });

  await prisma.user.upsert({
    where: { email },
    create: {
      email,
      name: "Admin",
      role: "ADMIN",
      companyId: company.id,
      passwordHash,
      pinHash,
      confirmed: true,
    },
    update: {
      name: "Admin",
      role: "ADMIN",
      passwordHash,
      pinHash,
      confirmed: true,
    },
  });

  // Buat super admin
  const superAdminEmail = "sawitreport00@gmail.com";
  const superAdminPassword = await bcrypt.hash("D1d1kSunt0r0@#$", 12);
  await prisma.user.upsert({
    where: { email: superAdminEmail },
    create: {
      email: superAdminEmail,
      name: "Super Admin",
      role: "ADMIN",
      isSuperAdmin: true,
      companyId: company.id,
      passwordHash: superAdminPassword,
      confirmed: true,
    },
    update: {
      name: "Super Admin",
      role: "ADMIN",
      isSuperAdmin: true,
      passwordHash: superAdminPassword,
      confirmed: true,
    },
  });

  await prisma.appPin.upsert({
    where: { kind: "MASTER" },
    create: { kind: "MASTER", pinHash: pinMasterHash },
    update: { pinHash: pinMasterHash },
  });

  await prisma.appPin.upsert({
    where: { kind: "INPUT" },
    create: { kind: "INPUT", pinHash: pinInputHash },
    update: { pinHash: pinInputHash },
  });

  await prisma.appPin.upsert({
    where: { kind: "REPORT" },
    create: { kind: "REPORT", pinHash: pinReportHash },
    update: { pinHash: pinReportHash },
  });

  const kegiatanPerawatanSeed = [
    { kode: "PRUN", nama: "Prunning", kategori: "Perawatan" },
    { kode: "SANI", nama: "Sanitasi", kategori: "Perawatan" },
    { kode: "SMLL", nama: "Semprot Lalang", kategori: "Perawatan" },
    { kode: "SMTP", nama: "Semprot Piringan/TPH", kategori: "Perawatan" },
    { kode: "SMGL", nama: "Semprot Gulma", kategori: "Perawatan" },
    { kode: "JALN", nama: "Jalan", kategori: "Perawatan" },
  ];

  for (const k of kegiatanPerawatanSeed) {
    await prisma.kegiatanPerawatan.upsert({
      where: { kode: k.kode },
      create: k,
      update: { nama: k.nama, kategori: k.kategori },
    });
  }

  const jenisPupukSeed = [
    { kode: "NPK151515", nama: "NPK 15-15-15" },
    { kode: "UREA", nama: "Urea" },
    { kode: "ROCKPH", nama: "Rock Phospate" },
    { kode: "KIES", nama: "Kieserite" },
    { kode: "MOP", nama: "MOP" },
    { kode: "DOLO", nama: "Dolomite" },
  ];

  for (const p of jenisPupukSeed) {
    await prisma.jenisPupuk.upsert({
      where: { kode: p.kode },
      create: p,
      update: { nama: p.nama },
    });
  }

  await prisma.laporanSchedule.upsert({
    where: { companyId: company.id },
    update: {},
    create: {
      companyId: company.id,
      aktif: true,
      kirimHari: 5,
      kirimJam: 8,
      penerima: "putrigracela8@gmail.com",
    },
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
