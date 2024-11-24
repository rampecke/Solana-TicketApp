-- DropForeignKey
ALTER TABLE "Collectable" DROP CONSTRAINT "Collectable_collectionId_fkey";

-- DropForeignKey
ALTER TABLE "Collection" DROP CONSTRAINT "Collection_eventId_fkey";

-- DropForeignKey
ALTER TABLE "PriceCategory" DROP CONSTRAINT "PriceCategory_eventId_fkey";

-- DropForeignKey
ALTER TABLE "Ticket" DROP CONSTRAINT "Ticket_eventId_fkey";

-- DropForeignKey
ALTER TABLE "Ticket" DROP CONSTRAINT "Ticket_priceCategoryId_fkey";

-- AlterTable
ALTER TABLE "Event" ADD COLUMN     "eventDescription" TEXT;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_priceCategoryId_fkey" FOREIGN KEY ("priceCategoryId") REFERENCES "PriceCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PriceCategory" ADD CONSTRAINT "PriceCategory_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Collectable" ADD CONSTRAINT "Collectable_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Collection" ADD CONSTRAINT "Collection_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;
