-- CreateEnum
CREATE TYPE "public"."PinKind" AS ENUM ('MASTER', 'INPUT');

-- CreateTable
CREATE TABLE "public"."AppPin" (
    "id" TEXT NOT NULL,
    "kind" "public"."PinKind" NOT NULL,
    "pinHash" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppPin_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "AppPin_kind_key" ON "public"."AppPin"("kind");
