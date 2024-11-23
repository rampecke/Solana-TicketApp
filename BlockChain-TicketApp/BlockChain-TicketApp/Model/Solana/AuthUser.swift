//
//  AuthUser.swift
//  BlockChain-TicketApp
//
//  Created by Simon Osterlehner on 23.11.24.
//
import SolanaSwift

public struct AuthUser {
    public var name: String?
    public var email: String?
    public var profileImage: String?
    
    public var key: KeyPair
}
