-- CreateTable
CREATE TABLE "public"."WorkCalendar" (
    "id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "isWorking" BOOLEAN NOT NULL DEFAULT true,
    "note" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WorkCalendar_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "WorkCalendar_tanggal_key" ON "public"."WorkCalendar"("tanggal");

-- CreateIndex
CREATE INDEX "WorkCalendar_tanggal_idx" ON "public"."WorkCalendar"("tanggal");
