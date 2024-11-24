import express from "express";
import ViteExpress from "vite-express";
import { prisma } from "./prisma";
import { sendNFT } from "./web3";

const app = express();

app.use(express.json());

app.get("/", (_, res) => {
  res.send("Hello at Eventure!");
});

app.get("/events", async (_, res) => {
  const events = await prisma.event.findMany({
    include: {
      collection: {
        include: {
          collectables: true,
        },
      },
      _count: {
        select: {
          tickets: {
            where: { buyerWalletAddress: null },
          },
        },
      },
    },
  });

  res.send(events);
});

app.post("/events/:id/buy", async (req, res) => {
  const id = (req.params.id as string)?.toLowerCase();
  const walletAddress = req.body.walletAddress as string;

  const event = await prisma.event.findUnique({
    where: {
      id,
    },
    include: {
      tickets: true,
    },
  });

  if (!event) throw new Error("Ticket not found");
  if (event?.startTime.getTime() <= new Date().getTime())
    throw new Error("Event has ended");

  if (event.tickets.length === 0) throw new Error("No tickets available");
  if (event.tickets.every((ticket) => ticket.buyerWalletAddress)) {
    throw new Error("All tickets are sold out");
  }

  // Pick the first available ticket
  const ticket = event.tickets.find((ticket) => !ticket.buyerWalletAddress)!;

  // Update the ticket with the buyer's wallet address
  const updatedTicket = await prisma.ticket.update({
    where: {
      id: ticket.id,
    },
    data: {
      buyerWalletAddress: walletAddress,
    },
  });

  res.send(updatedTicket);
});

app.get("/tickets", async (req, res) => {
  if (req.query.boughtBy) {
    const tickets = await prisma.ticket.findMany({
      where: {
        buyerWalletAddress: req.query.boughtBy as string,
      },
    });

    res.send(tickets);
  } else {
    let tickets = await prisma.ticket.findMany();

    res.send(tickets);
  }
});

app.post("/tickets/:id/claim", async (req, res) => {
  const id = req.params.id as string;
  const walletAddress = req.body.walletAddress as string;

  const [_, updatedCollectable] = await prisma.$transaction(async (tx) => {
    const ticket = await tx.ticket.findUnique({
      where: {
        id,
      },
      include: {
        event: true,
      },
    });

    if (!ticket) throw new Error("Ticket not found");
    if (ticket?.claimedWalletAddress) throw new Error("Ticket already claimed");
    if (ticket.event.endTime > new Date())
      throw new Error("Event has not ended yet");
    if (ticket.buyerWalletAddress !== walletAddress)
      throw new Error("Unauthorized");

    // Update ticket
    const updatedTicket = await tx.ticket.update({
      where: {
        id,
      },
      data: {
        claimedWalletAddress: walletAddress,
      },
    });

    // Fetch all collectables that are not claimed yet
    const collectables = await tx.collectable.findMany({
      where: {
        collection: {
          eventId: ticket.eventId,
        },
        claimed: false,
      },
    });

    // Pick one random collectable
    const randomCollectable =
      collectables[Math.floor(Math.random() * collectables.length)];

    // Update the collectable
    const updatedCollectable = await tx.collectable.update({
      where: {
        id: randomCollectable.id,
      },
      data: {
        claimed: true,
      },
    });

    // Send the NFT to the buyer
    await sendNFT(randomCollectable.nftAddress, walletAddress);

    return [updatedTicket, updatedCollectable];
  });

  res.send(updatedCollectable);
});

ViteExpress.listen(app, 3000, () =>
  console.log("Server is listening on port 3000...")
);
