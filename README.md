# Eventure

## Inspiration

The inspiration for **Eventure** stemmed from the numerous frauds and scams in online ticket retailing. These issues are particularly devastating for bigger artists when their fans are exploited, paying exorbitant resale prices or buying fake tickets. Blockchain technology, with its transparency and traceability, is an ideal solution for this problem. By ensuring that tickets are genuine and tracking their lifecycle, we can prevent unauthorized price hikes. Smart contracts, in particular, allow for price caps, ensuring ticket prices remain affordable. While working on this concept, we came up with an exciting way to enhance the app even further.

## What it does

**Eventure** is a comprehensive ticket management app featuring buying, searching, and ticket management systems built on the **Solana blockchain**. This ensures secure transactions for buying tickets. What makes it unique is the inclusion of **NFT collectibles** that users receive after each event, transformed from their tickets. These collectibles serve as memorabilia tied to specific events, offering tremendous potential for collectors. Fans are often deeply connected to their favorite artists, and each tour can feature multiple collectibles, encouraging users to complete their sets. These NFTs are generated exclusively for ticket holders, ensuring their rarity and value.

## How we built it

We developed **Eventure** as a native iOS application using **Swift** and **SwiftUI** for the client side. For event management beyond tickets and NFTs, we utilized a **PostgreSQL database** supported by a server written in **TypeScript** with **Node.js**. The **Solana blockchain** supports the ticketing and collectible systems, with Solana programs handling the blockchain functionality. Since we aimed to make it user-friendly, we decided to use **Google Services** for authentication.

## Challenges we ran into

One of our biggest challenges was Solana’s limited support for languages other than **Rust** and **TypeScript**. The Swift library we relied on was based on deprecated code, which created significant roadblocks. As blockchain technology was new to our team, navigating these challenges was particularly demanding, especially with no prior experience.

## Accomplishments that we're proud of

Although we realized late in the development process that **Swift** might not have been the best choice for Solana integration, we persevered. A key achievement we’re proud of is our contribution to fixing and improving parts of the existing **Swift library for Solana**, ensuring future developers can benefit from our work.

## What we learned

This project was a deep dive into **blockchain technology**. We spent significant time exploring its use cases and understanding its potential. For most of the team, this was their first experience with blockchain development, and tackling such a challenging technology head-on was one of the most interesting aspects of this hackathon.

## What's next for Eventure

The future of **Eventure** is open-ended, but with more time, we’d love to refine the **collectible trading experience** further. Additionally, tackling the complexities of **ticket resale** would be a priority, as our current implementation only supports initial ticket purchases and collectible generation.
