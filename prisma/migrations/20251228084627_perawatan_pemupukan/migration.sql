-- CreateTable
CREATE TABLE "public"."PerawatanBlok" (
    "id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "blokId" TEXT NOT NULL,
    "kegiatan" TEXT NOT NULL,
    "volume" DECIMAL(12,2),
    "satuan" TEXT,
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PerawatanBlok_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."PemupukanBlok" (
    "id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "blokId" TEXT NOT NULL,
    "jenisPupuk" TEXT NOT NULL,
    "dosisKgHa" DECIMAL(12,2),
    "totalKg" DECIMAL(12,2),
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PemupukanBlok_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PerawatanBlok_tanggal_idx" ON "public"."PerawatanBlok"("tanggal");

-- CreateIndex
CREATE UNIQUE INDEX "PerawatanBlok_tanggal_blokId_key" ON "public"."PerawatanBlok"("tanggal", "blokId");

-- CreateIndex
CREATE INDEX "PemupukanBlok_tanggal_idx" ON "public"."PemupukanBlok"("tanggal");

-- CreateIndex
CREATE UNIQUE INDEX "PemupukanBlok_tanggal_blokId_key" ON "public"."PemupukanBlok"("tanggal", "blokId");

-- AddForeignKey
ALTER TABLE "public"."PerawatanBlok" ADD CONSTRAINT "PerawatanBlok_blokId_fkey" FOREIGN KEY ("blokId") REFERENCES "public"."Blok"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."PemupukanBlok" ADD CONSTRAINT "PemupukanBlok_blokId_fkey" FOREIGN KEY ("blokId") REFERENCES "public"."Blok"("id") ON DELETE CASCADE ON UPDATE CASCADE;
