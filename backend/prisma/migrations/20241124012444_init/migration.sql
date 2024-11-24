-- CreateEnum
CREATE TYPE "EventCategory" AS ENUM ('Music', 'Sports', 'ArtsTheatre', 'Conference', 'Fair', 'Other');

-- CreateTable
CREATE TABLE "Event" (
    "id" TEXT NOT NULL,
    "eventName" TEXT NOT NULL,
    "startTime" TIMESTAMP(3) NOT NULL,
    "endTime" TIMESTAMP(3) NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "organizerName" TEXT NOT NULL,
    "nameLocation" TEXT,
    "locationLatitude" DOUBLE PRECISION,
    "locationLongitude" DOUBLE PRECISION,
    "eventCategory" "EventCategory" NOT NULL,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ticket" (
    "id" TEXT NOT NULL,
    "eventId" TEXT NOT NULL,
    "priceCategoryId" TEXT NOT NULL,
    "buyerWalletAddress" TEXT,
    "claimedWalletAddress" TEXT,
    "seatingBlock" TEXT NOT NULL,
    "seatingRow" TEXT NOT NULL,
    "seatinSeat" TEXT NOT NULL,

    CONSTRAINT "Ticket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PriceCategory" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "eventId" TEXT NOT NULL,

    CONSTRAINT "PriceCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Collectable" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "collectionId" TEXT NOT NULL,
    "nftAddress" TEXT NOT NULL,
    "claimed" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Collectable_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Collection" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "eventId" TEXT NOT NULL,

    CONSTRAINT "Collection_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Collectable_nftAddress_key" ON "Collectable"("nftAddress");

-- CreateIndex
CREATE UNIQUE INDEX "Collection_eventId_key" ON "Collection"("eventId");

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ticket" ADD CONSTRAINT "Ticket_priceCategoryId_fkey" FOREIGN KEY ("priceCategoryId") REFERENCES "PriceCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PriceCategory" ADD CONSTRAINT "PriceCategory_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Collectable" ADD CONSTRAINT "Collectable_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Collection" ADD CONSTRAINT "Collection_eventId_fkey" FOREIGN KEY ("eventId") REFERENCES "Event"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
