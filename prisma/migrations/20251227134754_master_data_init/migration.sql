-- CreateTable
CREATE TABLE "public"."Kebun" (
    "id" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "lokasi" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Kebun_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Afdeling" (
    "id" TEXT NOT NULL,
    "kebunId" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Afdeling_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Blok" (
    "id" TEXT NOT NULL,
    "afdelingId" TEXT NOT NULL,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "luasHa" DECIMAL(10,2),
    "tahunTanam" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Blok_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Kebun_kode_key" ON "public"."Kebun"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "Afdeling_kebunId_kode_key" ON "public"."Afdeling"("kebunId", "kode");

-- CreateIndex
CREATE UNIQUE INDEX "Blok_afdelingId_kode_key" ON "public"."Blok"("afdelingId", "kode");

-- AddForeignKey
ALTER TABLE "public"."Afdeling" ADD CONSTRAINT "Afdeling_kebunId_fkey" FOREIGN KEY ("kebunId") REFERENCES "public"."Kebun"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."Blok" ADD CONSTRAINT "Blok_afdelingId_fkey" FOREIGN KEY ("afdelingId") REFERENCES "public"."Afdeling"("id") ON DELETE CASCADE ON UPDATE CASCADE;
