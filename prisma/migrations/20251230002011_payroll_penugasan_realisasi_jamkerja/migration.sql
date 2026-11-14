-- AlterTable
ALTER TABLE "AbsensiItem" ADD COLUMN     "jamKerja" DECIMAL(6,2);

-- CreateTable
CREATE TABLE "PenugasanRealisasi" (
    "id" TEXT NOT NULL,
    "penugasanId" TEXT NOT NULL,
    "jjg" INTEGER NOT NULL DEFAULT 0,
    "brondolanKg" DECIMAL(12,2),
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PenugasanRealisasi_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PenugasanRealisasi_penugasanId_key" ON "PenugasanRealisasi"("penugasanId");

-- AddForeignKey
ALTER TABLE "PenugasanRealisasi" ADD CONSTRAINT "PenugasanRealisasi_penugasanId_fkey" FOREIGN KEY ("penugasanId") REFERENCES "Penugasan"("id") ON DELETE CASCADE ON UPDATE CASCADE;
