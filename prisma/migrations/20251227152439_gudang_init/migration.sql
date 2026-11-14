-- CreateEnum
CREATE TYPE "public"."TipeTransaksiGudang" AS ENUM ('MASUK', 'KELUAR');

-- CreateTable
CREATE TABLE "public"."Barang" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "kategori" TEXT,
    "satuan" TEXT NOT NULL DEFAULT 'kg',
    "stokMin" DECIMAL(12,2),
    "aktif" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Barang_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."TransaksiGudang" (
    "id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "tipe" "public"."TipeTransaksiGudang" NOT NULL,
    "barangId" TEXT NOT NULL,
    "qty" DECIMAL(12,2) NOT NULL,
    "referensi" TEXT,
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TransaksiGudang_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Barang_kode_key" ON "public"."Barang"("kode");

-- CreateIndex
CREATE INDEX "TransaksiGudang_tanggal_idx" ON "public"."TransaksiGudang"("tanggal");

-- CreateIndex
CREATE INDEX "TransaksiGudang_barangId_idx" ON "public"."TransaksiGudang"("barangId");

-- AddForeignKey
ALTER TABLE "public"."TransaksiGudang" ADD CONSTRAINT "TransaksiGudang_barangId_fkey" FOREIGN KEY ("barangId") REFERENCES "public"."Barang"("id") ON DELETE CASCADE ON UPDATE CASCADE;
