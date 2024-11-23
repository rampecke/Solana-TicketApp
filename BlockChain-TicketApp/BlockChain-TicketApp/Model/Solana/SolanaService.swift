//
//  SolanaService2.swift
//  BlockChain-TicketApp
//
//  Created by Simon Osterlehner on 23.11.24.
//

import Foundation
import SolanaSwift
import Web3Auth

class MyCustomLogger: SolanaSwiftLogger {
    func log(event: String, data: String?, logLevel: SolanaSwiftLoggerLogLevel) {
        //print("\(event): \(data ?? "")")
        // Custom log goes here
    }
}

class SolanaService {
    private let network = Network.devnet
    
    private let apiClient: JSONRPCAPIClient;
    private let blockchainClient: BlockchainClient;
    
    private var web3Auth: Web3Auth?;
    
    private let programId = PublicKey("Fg6PaFpoGXkYsidMpWTK6W2BeZ7FEfcYkg476zPFsLnS")
    
    init() {
        // let customLogger: SolanaSwiftLogger = MyCustomLogger()
        // SolanaSwift.Logger.setLoggers([customLogger])
        
        let endpoint = APIEndPoint(
            address: "https://api.devnet.solana.com",
            network: .devnet
        )
        
        self.apiClient = JSONRPCAPIClient(endpoint: endpoint)
        self.blockchainClient = BlockchainClient(apiClient: self.apiClient)
    }
    
    private func initWeb3Auth() async throws {
        if (self.web3Auth == nil) {
            self.web3Auth = try await Web3Auth(
                W3AInitParams(
                    clientId: "BBGU-J5fnV-UE1gK-cZl7Tn888MZui60NIpsiR2O86lp_LzBSc-gSwVV_kp_aklcbAltyjr4J3ENO-sJv5Qo1Us",
                    network: .sapphire_devnet,
                    redirectUrl: "com.simolation.BlockChain-TicketApp://"
                )
            )
        }
    }
    
    /// Authenticate using Google signin
    func auth() async throws -> AuthUser {
        try await initWeb3Auth();
        
        try await self.web3Auth!.login(W3ALoginParams(loginProvider: .GOOGLE))
        
        // Check whether state is nil or not for user authentication status.
        let isUserAuthenticated = self.web3Auth!.state != nil
        
        if (!isUserAuthenticated) {
            throw NSError()
        }
        
        let userInfo = try self.web3Auth!.getUserInfo()
        
        let key = self.web3Auth!.getEd25519PrivKey()
        let keypair = try await self.loadFromHex(hex: key)
        
        return AuthUser(
            name: userInfo.name,
            email: userInfo.email,
            profileImage: userInfo.profileImage,
            key: keypair
        )
    }
    
    /// Create a new keypair
    func createAccount() async throws -> (KeyPair, String, String) {
        let keypair = try await KeyPair(network: self.network)
        let phrase = keypair.phrase.joined(separator: " ")
        let address = keypair.publicKey.base58EncodedString
        
        return (keypair, phrase, address)
    }
    
    /// Restore a keypair from the seed phrase
    func loadAccountFromPhrase(phrase: String) async throws -> KeyPair {
        let words = phrase.components(separatedBy: " ")
        let keypair = try await KeyPair(phrase: words, network: self.network)
        
        return keypair
    }
    
    /// Create a keypair from hex
    func loadFromHex(hex: String) async throws -> KeyPair {
        let keypair = try KeyPair(secretKey: Data(hex: hex))
        
        return keypair
    }
    
    /// Get the current SOL balance of the account
    func getBalance(account: String) async throws -> Int {
        let balance = try await apiClient.getBalance(account: account, commitment: "recent")
        
        return Int(balance)
    }
    
    /// Get the metadata of a token
    func getToken(mintId: String) async throws {
        let res = try await apiClient.getAsset(address: mintId)
        
        print(res)
    }
    
    /// Send SOL to another address
    func sendTokens(from: KeyPair, to: String, amount: Int) async throws -> TransactionID {
        // To get balance of the current account
        let balance = try await self.getBalance(account: to)
        
        print("Balance: \(balance)")
        
        let preparedTransaction = try await self.blockchainClient.prepareSendingNativeSOL(
            from: from,
            to: to,
            amount: 1
        )
        
        let transactionId = try await self.blockchainClient.sendTransaction(
            preparedTransaction: preparedTransaction
        )
        
        print("Transaction ID: \(transactionId)")
        
        return transactionId
    }
    
    /// List all tokens for a specific address
    func listTokens(account: String) async throws -> [AssetInfo] {
        // Fetch token accounts for the given address
        let tokenAccounts = try await apiClient.getTokenAccountsByOwner(
            pubkey: account,
            params: .init(mint: nil, programId: "TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA"),
            configs: .init(commitment: "processed", encoding: "base64")
        )
        
        var assets: [AssetInfo] = []
        
        // Iterate over each token account and fetch its metadata
        for tokenAccount in tokenAccounts {
            let mintId = tokenAccount.account.data.mint
            
            let assetInfo = try await apiClient.getAsset(address: mintId.base58EncodedString)
            print(assetInfo)
            
            assets.append(assetInfo)
        }
        
        return assets
    }
    
    // Initialize Calculator
    func initCalculator(owner: KeyPair, calculatorPublicKey: PublicKey) async throws -> String {
        let data: [BytesEncodable] = [UInt64(0)]
        
        let instruction = TransactionInstruction(
            keys: [
                .writable(publicKey: calculatorPublicKey, isSigner: false)
            ],
            programId: programId,
            data: data
            // "1" corresponds to `do_operation`, followed by the operation and number
        )
        
        let preparedTransaction = try await blockchainClient.prepareTransaction(
            instructions: [instruction],
            signers: [owner],
            feePayer: owner.publicKey
        )
        
        let transactionId = try await blockchainClient.sendTransaction(preparedTransaction: preparedTransaction)
        print("Initialized Calculator with Transaction ID: \(transactionId)")
        
        return transactionId
    }
    
    // Perform Operation
    func doOperation(
        owner: KeyPair,
        calculatorPublicKey: PublicKey,
        operation: Int, // 0 = ADD, 1 = SUB, 2 = MUL, 3 = DIV
        num: Int64
    ) async throws -> String {
        let instruction = TransactionInstruction(
            keys: [
                .writable(publicKey: calculatorPublicKey, isSigner: false)
            ],
            programId: programId,
            data: [1, UInt8(operation), UInt8(num)].compactMap { $0 }
            // "1" corresponds to `do_operation`, followed by the operation and number
        )
        
        let preparedTransaction = try await blockchainClient.prepareTransaction(
            instructions: [instruction],
            signers: [owner],
            feePayer: owner.publicKey
        )
        
        let transactionId = try await blockchainClient.sendTransaction(preparedTransaction: preparedTransaction)
        print("Performed operation \(operation) with num \(num). Transaction ID: \(transactionId)")
        
        return transactionId
    }
}
