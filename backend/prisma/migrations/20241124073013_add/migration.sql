/*
  Warnings:

  - You are about to drop the column `claimed` on the `Collectable` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Collectable" DROP COLUMN "claimed",
ADD COLUMN     "claimedByAddress" TEXT;
