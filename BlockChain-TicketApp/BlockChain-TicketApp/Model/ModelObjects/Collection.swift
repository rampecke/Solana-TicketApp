//
//  Collection.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

class Collection {
    var titel: String
    var event: OrganizationEvent
    var possibleCollectables: [Collectable]
    
    init(titel: String, event: OrganizationEvent, possibleCollectables: [Collectable]) {
        self.titel = titel
        self.event = event
        self.possibleCollectables = possibleCollectables
    }
}
