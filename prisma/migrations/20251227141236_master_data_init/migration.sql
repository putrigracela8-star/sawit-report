-- CreateEnum
CREATE TYPE "public"."JenisPekerja" AS ENUM ('TETAP', 'HARIAN', 'BORONGAN');

-- CreateTable
CREATE TABLE "public"."Jabatan" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Jabatan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Kegiatan" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "kategori" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Kegiatan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Pekerja" (
    "id" TEXT NOT NULL,
    "nik" TEXT,
    "nama" TEXT NOT NULL,
    "jenis" "public"."JenisPekerja" NOT NULL DEFAULT 'HARIAN',
    "aktif" BOOLEAN NOT NULL DEFAULT true,
    "jabatanId" TEXT,
    "afdelingId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pekerja_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Jabatan_kode_key" ON "public"."Jabatan"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "Kegiatan_kode_key" ON "public"."Kegiatan"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "Pekerja_nik_key" ON "public"."Pekerja"("nik");

-- AddForeignKey
ALTER TABLE "public"."Pekerja" ADD CONSTRAINT "Pekerja_jabatanId_fkey" FOREIGN KEY ("jabatanId") REFERENCES "public"."Jabatan"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Pekerja" ADD CONSTRAINT "Pekerja_afdelingId_fkey" FOREIGN KEY ("afdelingId") REFERENCES "public"."Afdeling"("id") ON DELETE SET NULL ON UPDATE CASCADE;
