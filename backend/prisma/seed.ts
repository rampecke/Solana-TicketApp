import { PrismaClient, Prisma, $Enums } from "@prisma/client";
import { lstat, readdir, readFile } from "fs/promises";
import { resolve } from "path";
import { randomUUID } from "crypto";

export const prisma = new PrismaClient();

async function main() {
  const traverseFolder = async (
    folderPath: string
  ): Promise<
    [
      Prisma.EventCreateManyInput[],
      Prisma.TicketCreateManyInput[],
      Prisma.CollectionCreateManyInput[]
    ]
  > => {
    const events: Prisma.EventCreateManyInput[] = [];
    const tickets: Prisma.TicketCreateManyInput[] = [];
    const collections: Prisma.CollectionCreateManyInput[] = [];

    const subdirs = await readdir(folderPath);

    for (const subdir of subdirs) {
      const res = resolve(folderPath, subdir);
      const stat = await lstat(res);

      if (stat.isDirectory()) {
        const [e, t, c] = await traverseFolder(res);
        events.push(...e);
        tickets.push(...t);
        collections.push(...c);
      } else {
        if (res.includes(".json")) {
          // Read JSON file
          const data = await readFile(res, "utf8");

          const json = JSON.parse(data);

          let category: $Enums.EventCategory;
          switch (json.eventCategory) {
            case "Music":
              category = "Music";
              break;
            case "Sports":
              category = "Sports";
              break;
            case "Theater":
              category = "ArtsTheatre";
              break;
            case "Conference":
              category = "Conference";
              break;
            default:
              category = "Other";
              break;
          }

          const event: Prisma.EventCreateManyInput = {
            id: randomUUID(),
            startTime: new Date(json.startTime),
            endTime: new Date(json.endTime),
            locationLatitude: json.location.latitude,
            locationLongitude: json.location.longitude,
            nameLocation: json.nameLocation,
            eventName: json.eventName,
            eventDescription: json.eventDescription,
            eventCategory: category,
            organizerName: json.organizerName,
            imageUrl: json.imageUrl,
          };

          const numberOfTickets = Math.floor(Math.random() * 11) + 10; // Random number between 10 and 20

          for (let i = 0; i < numberOfTickets; i++) {
            const randomTicket: Prisma.TicketCreateManyInput = {
              eventId: event.id!,
              // Category between 1 and 4 randomly
              priceCategory: Math.floor(Math.random() * 4) + 1,
              seatingBlock: (Math.floor(Math.random() * 10) + 1).toString(),
              seatingRow: (Math.floor(Math.random() * 10) + 1).toString(),
              seatingSeat: (Math.floor(Math.random() * 100) + 1).toString(),
            };

            tickets.push(randomTicket);
          }

          const collection: Prisma.CollectionCreateManyInput = {
            id: randomUUID(),
            eventId: event.id!,
            name: "Hi",
          };

          collections.push(collection);

          // Now you can use the `tickets` array to create multiple tickets in your database

          events.push(event);
        }
      }
    }

    return [events, tickets, collections];
  };
  // const [events, tickets, collections] = await traverseFolder(
  //   "/Users/simon/Downloads/Hackathon/Events"
  // );

  // console.log(events);

  // // Create events
  // await prisma.event.createMany({
  //   data: events,
  // });

  // // Create tickets
  // await prisma.ticket.createMany({
  //   data: tickets,
  // });

  // // Create collections
  // await prisma.collection.createMany({
  //   data: collections,
  // });

  // Ed Sheeran
  // "fead9cdf-c28a-460d-a994-402538d22423"

  // Macklemore
  // "691c24c9-e42f-4202-ac97-e784d8324c6e"

  // P!INK
  // "1442d8a1-b26c-426d-aa1c-d633aead4398"

  // Robbie Williams
  // "7fab0a39-049a-47e2-ba1d-ac7eb932c660"
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
