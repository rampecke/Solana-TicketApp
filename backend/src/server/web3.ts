import { Connection, Keypair, PublicKey, Transaction } from "@solana/web3.js";
import { programs } from "@metaplex/js";

const keypair = Keypair.generate();
const connection = new Connection("https://api.devnet.solana.com");

const {
  metadata: { Metadata },
} = programs;

// Send an NFT to the provided address
export const sendNFT = async (nftAddress: string, recipientAddress: string) => {
  const nftPublicKey = new PublicKey(nftAddress);
  const recipientPublicKey = new PublicKey(recipientAddress);

  // Fetch the metadata of the NFT
  const metadataPDA = await Metadata.getPDA(nftPublicKey);
  const metadata = await Metadata.load(connection, metadataPDA);

  // Get the associated token account of the recipient
  const recipientTokenAccount =
    await programs.token.getOrCreateAssociatedTokenAccount(
      connection,
      recipientPublicKey,
      metadata.data.mint,
      keypair,
    );

  // Create the transaction to transfer the NFT
  const transaction = new Transaction().add(
    programs.token.createTransferInstruction(
      keypair.publicKey,
      recipientTokenAccount.address,
      keypair.publicKey,
      1, // Assuming the NFT has a supply of 1
      [],
      programs.token.TOKEN_PROGRAM_ID,
    ),
  );

  const signature = await connection.sendTransaction(transaction, [keypair]);
  await connection.confirmTransaction(signature);

  console.log(
    `NFT sent to ${recipientAddress}. Transaction signature: ${signature}`,
  );
};
