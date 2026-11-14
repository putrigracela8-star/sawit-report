-- CreateEnum
CREATE TYPE "PayrollStatus" AS ENUM ('DRAFT', 'LOCKED');

-- CreateEnum
CREATE TYPE "PayrollAdjustmentType" AS ENUM ('BONUS', 'POTONGAN');

-- CreateTable
CREATE TABLE "PayrollTarifGlobal" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "upahPerJam" DECIMAL(12,2) NOT NULL,
    "tarifPanenPerJjg" DECIMAL(12,2) NOT NULL,
    "tarifPanenBrondolan" DECIMAL(12,2) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PayrollTarifGlobal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PayrollPeriode" (
    "id" TEXT NOT NULL,
    "fromDate" TIMESTAMP(3) NOT NULL,
    "toDate" TIMESTAMP(3) NOT NULL,
    "status" "PayrollStatus" NOT NULL DEFAULT 'DRAFT',
    "afdelingId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PayrollPeriode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PayrollSlip" (
    "id" TEXT NOT NULL,
    "periodeId" TEXT NOT NULL,
    "pekerjaId" TEXT NOT NULL,
    "totalHarian" DECIMAL(14,2) NOT NULL,
    "totalBorongan" DECIMAL(14,2) NOT NULL,
    "totalBonus" DECIMAL(14,2) NOT NULL,
    "totalPotongan" DECIMAL(14,2) NOT NULL,
    "grandTotal" DECIMAL(14,2) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PayrollSlip_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PayrollSlipLine" (
    "id" TEXT NOT NULL,
    "slipId" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "qty" DECIMAL(14,2),
    "rate" DECIMAL(14,2),
    "amount" DECIMAL(14,2) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PayrollSlipLine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PayrollAdjustment" (
    "id" TEXT NOT NULL,
    "periodeId" TEXT NOT NULL,
    "pekerjaId" TEXT NOT NULL,
    "type" "PayrollAdjustmentType" NOT NULL,
    "amount" DECIMAL(14,2) NOT NULL,
    "note" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PayrollAdjustment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PayrollTarifGlobal_key_key" ON "PayrollTarifGlobal"("key");

-- CreateIndex
CREATE INDEX "PayrollPeriode_fromDate_idx" ON "PayrollPeriode"("fromDate");

-- CreateIndex
CREATE INDEX "PayrollPeriode_toDate_idx" ON "PayrollPeriode"("toDate");

-- CreateIndex
CREATE INDEX "PayrollPeriode_afdelingId_idx" ON "PayrollPeriode"("afdelingId");

-- CreateIndex
CREATE UNIQUE INDEX "PayrollPeriode_fromDate_toDate_afdelingId_key" ON "PayrollPeriode"("fromDate", "toDate", "afdelingId");

-- CreateIndex
CREATE INDEX "PayrollSlip_periodeId_idx" ON "PayrollSlip"("periodeId");

-- CreateIndex
CREATE INDEX "PayrollSlip_pekerjaId_idx" ON "PayrollSlip"("pekerjaId");

-- CreateIndex
CREATE UNIQUE INDEX "PayrollSlip_periodeId_pekerjaId_key" ON "PayrollSlip"("periodeId", "pekerjaId");

-- CreateIndex
CREATE INDEX "PayrollSlipLine_slipId_idx" ON "PayrollSlipLine"("slipId");

-- CreateIndex
CREATE INDEX "PayrollAdjustment_periodeId_idx" ON "PayrollAdjustment"("periodeId");

-- CreateIndex
CREATE INDEX "PayrollAdjustment_pekerjaId_idx" ON "PayrollAdjustment"("pekerjaId");

-- AddForeignKey
ALTER TABLE "PayrollPeriode" ADD CONSTRAINT "PayrollPeriode_afdelingId_fkey" FOREIGN KEY ("afdelingId") REFERENCES "Afdeling"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollSlip" ADD CONSTRAINT "PayrollSlip_periodeId_fkey" FOREIGN KEY ("periodeId") REFERENCES "PayrollPeriode"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollSlip" ADD CONSTRAINT "PayrollSlip_pekerjaId_fkey" FOREIGN KEY ("pekerjaId") REFERENCES "Pekerja"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollSlipLine" ADD CONSTRAINT "PayrollSlipLine_slipId_fkey" FOREIGN KEY ("slipId") REFERENCES "PayrollSlip"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollAdjustment" ADD CONSTRAINT "PayrollAdjustment_periodeId_fkey" FOREIGN KEY ("periodeId") REFERENCES "PayrollPeriode"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PayrollAdjustment" ADD CONSTRAINT "PayrollAdjustment_pekerjaId_fkey" FOREIGN KEY ("pekerjaId") REFERENCES "Pekerja"("id") ON DELETE CASCADE ON UPDATE CASCADE;
