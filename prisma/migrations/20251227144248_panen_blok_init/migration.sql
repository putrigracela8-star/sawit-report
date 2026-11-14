-- CreateTable
CREATE TABLE "public"."PanenBlok" (
    "id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "blokId" TEXT NOT NULL,
    "jjg" INTEGER NOT NULL DEFAULT 0,
    "tonaseKg" DECIMAL(12,2),
    "brondolanKg" DECIMAL(12,2),
    "catatan" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PanenBlok_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "PanenBlok_tanggal_idx" ON "public"."PanenBlok"("tanggal");

-- CreateIndex
CREATE UNIQUE INDEX "PanenBlok_tanggal_blokId_key" ON "public"."PanenBlok"("tanggal", "blokId");

-- AddForeignKey
ALTER TABLE "public"."PanenBlok" ADD CONSTRAINT "PanenBlok_blokId_fkey" FOREIGN KEY ("blokId") REFERENCES "public"."Blok"("id") ON DELETE CASCADE ON UPDATE CASCADE;
