//
//  Profile.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

@Observable
class Profile {
    var name: String
    var profilePictureUrl: String
    
    init(name: String, profilePictureUrl: String) {
        self.name = name
        self.profilePictureUrl = profilePictureUrl
    }
}
