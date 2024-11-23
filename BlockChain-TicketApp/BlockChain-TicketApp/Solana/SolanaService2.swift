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
        print("\(event): \(data ?? "")")
        // Custom log goes here
    }
}

// AppDelegate or somewhere else


class SolanaService2 {
    private let network = Network.devnet
    
    private let apiClient: JSONRPCAPIClient;
    private let blockchainClient: BlockchainClient;
    
    private var web3Auth: Web3Auth?;
    
    private let programId = PublicKey("Fg6PaFpoGXkYsidMpWTK6W2BeZ7FEfcYkg476zPFsLnS")
    
    init() {
        let customLogger: SolanaSwiftLogger = MyCustomLogger()
        SolanaSwift.Logger.setLoggers([customLogger])
        
        let endpoint = APIEndPoint(
            address: "https://devnet.helius-rpc.com/?api-key=f3a21333-230f-44d2-8486-d1b00961dedd",
            network: .devnet
        )
        
        self.apiClient = JSONRPCAPIClient(endpoint: endpoint)
        self.blockchainClient = BlockchainClient(apiClient: self.apiClient)
    }
    
    func initWeb3Auth() async throws {
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
    
    func auth() async throws -> KeyPair {
        try await initWeb3Auth();
        
        try await self.web3Auth!.login(W3ALoginParams(loginProvider: .GOOGLE))
        
        // Check whether state is nil or not for user authentication status.
        let isUserAuthenticated = self.web3Auth!.state != nil
        
        if (!isUserAuthenticated) {
            throw NSError()
        }
        
        let userInfo = try self.web3Auth!.getUserInfo()
        
        print("UserInfo: \(userInfo)")
        
        let key = self.web3Auth!.getEd25519PrivKey()
        print("Key: \(key)")
        
        return try await self.loadFromHex(hex: key)
    }
    
    func createAccount() async throws -> (KeyPair, String, String) {
        let keypair = try await KeyPair(network: self.network)
        let phrase = keypair.phrase.joined(separator: " ")
        let address = keypair.publicKey.base58EncodedString
        
        return (keypair, phrase, address)
    }
    
    
    func loadAccountFromPhrase(phrase: String) async throws -> KeyPair {
        let words = phrase.components(separatedBy: " ")
        let keypair = try await KeyPair(phrase: words, network: self.network)
        
        return keypair
    }
    
    func loadFromHex(hex: String) async throws -> KeyPair {
        let keypair = try KeyPair(secretKey: Data(hex: hex))
        
        return keypair
    }
    
    func getBalance(account: String) async throws -> Int {
        let balance = try await apiClient.getBalance(account: account, commitment: "recent")
        
        return Int(balance)
    }
    
    private func perpareTransaction(from: KeyPair) async throws -> PreparedTransaction {
        let transaction = try await blockchainClient.prepareSendingNativeSOL(
            from: from,
            to: "2idRaWFin4Zn5WY9or6XBhcoF6cyfDWSbJQ26jAtptxD",
            amount: 0.01.toLamport(decimals: 9)
        )
        
        return transaction
    }
    
    func sendTokens(from: KeyPair, to: String, amount: Int) async throws -> TransactionID {
        // To get balance of the current account
        let balance = try await self.getBalance(account: to)
        
        print("Balance: \(balance)")
        
        var preparedTransaction = try await self.blockchainClient.prepareSendingNativeSOL(
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
    
    // Initialize Calculator
    func initCalculator(owner: KeyPair, calculatorPublicKey: PublicKey) async throws -> String {
        let data: [BytesEncodable] = [UInt8(0)].compactMap { $0 }
        
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
