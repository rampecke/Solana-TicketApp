/*
  Warnings:

  - You are about to drop the `PriceCategory` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `priceCategory` to the `Ticket` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "PriceCategory" DROP CONSTRAINT "PriceCategory_eventId_fkey";

-- DropForeignKey
ALTER TABLE "Ticket" DROP CONSTRAINT "Ticket_priceCategoryId_fkey";

-- AlterTable
ALTER TABLE "Ticket" ADD COLUMN     "priceCategory" INTEGER NOT NULL;

-- DropTable
DROP TABLE "PriceCategory";
