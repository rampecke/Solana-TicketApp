import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient();

async function main() {
  // Create events
  await prisma.event.createMany({
    data: [
      {
        startTime: new Date("2024-06-06T16:00:00Z"),
        endTime: new Date("2024-06-06T18:00:00Z"),
        locationLatitude: 51.5552,
        locationLongitude: -0.10839,
        nameLocation: "Emirates Stadium London",
        eventName: "Robbie Williams - Live 2025",
        eventDescription:
          "In the 1990s, he was one of Britain's premier pop bad boys, riding his time in the mega-selling Take That into a hit-studded solo career. Today, Robbie Williams is one of the world's most celebrated pop artists, having notched six albums in the Top 100 best-selling U.K. albums of all time, achieved a Guinness World Record for most concert tickets sold in a single day, and released a slew of singles — from the sweeping 1997 ballad 'Angels' to the cheeky 2012 banger 'Candy' — that hit No. 1 on charts around the world.",
        organizerName: "Robbie Williams",
        eventCategory: "Music",
        imageUrl: "",
      },
    ],
  });
}

main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
