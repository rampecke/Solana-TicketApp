/*
  Warnings:

  - You are about to drop the column `priceCategoryId` on the `Ticket` table. All the data in the column will be lost.
  - You are about to drop the column `seatinSeat` on the `Ticket` table. All the data in the column will be lost.
  - Added the required column `seatingSeat` to the `Ticket` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Ticket" DROP COLUMN "priceCategoryId",
DROP COLUMN "seatinSeat",
ADD COLUMN     "seatingSeat" TEXT NOT NULL;
