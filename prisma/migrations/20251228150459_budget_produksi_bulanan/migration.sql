-- CreateTable
CREATE TABLE "public"."BudgetProduksiBulanan" (
    "id" TEXT NOT NULL,
    "afdelingId" TEXT NOT NULL,
    "tahun" INTEGER NOT NULL,
    "bulan" INTEGER NOT NULL,
    "targetTon" DECIMAL(12,2) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BudgetProduksiBulanan_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "BudgetProduksiBulanan_tahun_bulan_idx" ON "public"."BudgetProduksiBulanan"("tahun", "bulan");

-- CreateIndex
CREATE UNIQUE INDEX "BudgetProduksiBulanan_afdelingId_tahun_bulan_key" ON "public"."BudgetProduksiBulanan"("afdelingId", "tahun", "bulan");

-- AddForeignKey
ALTER TABLE "public"."BudgetProduksiBulanan" ADD CONSTRAINT "BudgetProduksiBulanan_afdelingId_fkey" FOREIGN KEY ("afdelingId") REFERENCES "public"."Afdeling"("id") ON DELETE CASCADE ON UPDATE CASCADE;
