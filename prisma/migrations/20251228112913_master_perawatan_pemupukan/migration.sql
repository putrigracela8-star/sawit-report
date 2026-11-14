-- AlterTable
ALTER TABLE "public"."PemupukanBlok" ADD COLUMN     "jenisPupukId" TEXT,
ALTER COLUMN "jenisPupuk" DROP NOT NULL;

-- AlterTable
ALTER TABLE "public"."PerawatanBlok" ADD COLUMN     "kegiatanId" TEXT,
ALTER COLUMN "kegiatan" DROP NOT NULL;

-- CreateTable
CREATE TABLE "public"."KegiatanPerawatan" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "kategori" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "KegiatanPerawatan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."JenisPupuk" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "JenisPupuk_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "KegiatanPerawatan_kode_key" ON "public"."KegiatanPerawatan"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "JenisPupuk_kode_key" ON "public"."JenisPupuk"("kode");

-- AddForeignKey
ALTER TABLE "public"."PerawatanBlok" ADD CONSTRAINT "PerawatanBlok_kegiatanId_fkey" FOREIGN KEY ("kegiatanId") REFERENCES "public"."KegiatanPerawatan"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."PemupukanBlok" ADD CONSTRAINT "PemupukanBlok_jenisPupukId_fkey" FOREIGN KEY ("jenisPupukId") REFERENCES "public"."JenisPupuk"("id") ON DELETE SET NULL ON UPDATE CASCADE;
