-- CreateTable
CREATE TABLE "public"."PinAccess" (
    "id" TEXT NOT NULL,
    "kind" "public"."PinKind" NOT NULL,
    "token" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PinAccess_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "PinAccess_token_key" ON "public"."PinAccess"("token");

-- CreateIndex
CREATE INDEX "PinAccess_kind_idx" ON "public"."PinAccess"("kind");

-- CreateIndex
CREATE INDEX "PinAccess_expiresAt_idx" ON "public"."PinAccess"("expiresAt");
