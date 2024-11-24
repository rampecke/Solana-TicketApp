import { clusterApiUrl, Keypair, PublicKey } from '@solana/web3.js';
import { createUmi } from '@metaplex-foundation/umi-bundle-defaults';
import { createSignerFromKeypair, signerIdentity } from '@metaplex-foundation/umi';
import { TokenStandard, mplTokenMetadata, transferV1 } from '@metaplex-foundation/mpl-token-metadata';
import * as dotenv from 'dotenv';
dotenv.config();

const WALLET_SECRET_KEY = process.env.WALLET_SECRET_KEY;

const umi = createUmi(clusterApiUrl('devnet')).use(mplTokenMetadata())

const keypair1 = Keypair.fromSecretKey(new Uint8Array(JSON.parse(WALLET_SECRET_KEY ?? '')));

// Usually Keypairs are saved as Uint8Array, so you  
// need to transform it into a usable keypair.  
let keypair = umi.eddsa.createKeypairFromSecretKey(keypair1.secretKey);

// Before Umi can use this Keypair you need to generate 
// a Signer type with it.  
const signer = createSignerFromKeypair(umi, keypair);

// Tell Umi to use the new signer.
umi.use(signerIdentity(signer))

// Send an NFT to the provided address
export const sendNFT = async (nftAddress: string, recipientAddress: string) => {
  const nftPublicKey = new PublicKey(nftAddress);
  const recipientPublicKey = new PublicKey(recipientAddress);

  const transaction = await transferV1(umi, {
      mint: nftPublicKey,
      authority: signer,
      tokenOwner: signer.publicKey,
      destinationOwner: recipientPublicKey,
      tokenStandard: TokenStandard.NonFungible,
    }).sendAndConfirm(umi)
  console.log(transaction);
  console.log(
    `NFT sent to ${recipientAddress}.`,
  );
};
