//
//  Profile.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation
import SolanaSwift

@Observable
class Profile {
    var name: String?
    var profilePictureUrl: String?
    var keypair: KeyPair?
    
    var signedIn: Bool = false
}
