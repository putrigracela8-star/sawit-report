-- CreateTable
CREATE TABLE "public"."AbsensiHarian" (
    "id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "afdelingId" TEXT,
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AbsensiHarian_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."AbsensiItem" (
    "id" TEXT NOT NULL,
    "absensiId" TEXT NOT NULL,
    "pekerjaId" TEXT NOT NULL,
    "hadir" BOOLEAN NOT NULL DEFAULT false,
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AbsensiItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Penugasan" (
    "id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "pekerjaId" TEXT NOT NULL,
    "kegiatanId" TEXT NOT NULL,
    "afdelingId" TEXT,
    "blokId" TEXT,
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Penugasan_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AbsensiHarian_tanggal_afdelingId_key" ON "public"."AbsensiHarian"("tanggal", "afdelingId");

-- CreateIndex
CREATE UNIQUE INDEX "AbsensiItem_absensiId_pekerjaId_key" ON "public"."AbsensiItem"("absensiId", "pekerjaId");

-- CreateIndex
CREATE INDEX "Penugasan_tanggal_idx" ON "public"."Penugasan"("tanggal");

-- CreateIndex
CREATE INDEX "Penugasan_pekerjaId_idx" ON "public"."Penugasan"("pekerjaId");

-- AddForeignKey
ALTER TABLE "public"."AbsensiHarian" ADD CONSTRAINT "AbsensiHarian_afdelingId_fkey" FOREIGN KEY ("afdelingId") REFERENCES "public"."Afdeling"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."AbsensiItem" ADD CONSTRAINT "AbsensiItem_absensiId_fkey" FOREIGN KEY ("absensiId") REFERENCES "public"."AbsensiHarian"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."AbsensiItem" ADD CONSTRAINT "AbsensiItem_pekerjaId_fkey" FOREIGN KEY ("pekerjaId") REFERENCES "public"."Pekerja"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Penugasan" ADD CONSTRAINT "Penugasan_pekerjaId_fkey" FOREIGN KEY ("pekerjaId") REFERENCES "public"."Pekerja"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Penugasan" ADD CONSTRAINT "Penugasan_kegiatanId_fkey" FOREIGN KEY ("kegiatanId") REFERENCES "public"."Kegiatan"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Penugasan" ADD CONSTRAINT "Penugasan_afdelingId_fkey" FOREIGN KEY ("afdelingId") REFERENCES "public"."Afdeling"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Penugasan" ADD CONSTRAINT "Penugasan_blokId_fkey" FOREIGN KEY ("blokId") REFERENCES "public"."Blok"("id") ON DELETE SET NULL ON UPDATE CASCADE;
