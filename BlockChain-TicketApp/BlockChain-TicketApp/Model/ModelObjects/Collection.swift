//
//  Collection.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

@Observable
class Collection {
    var uuid: UUID = UUID()
    var titel: String
    var event: OrganizationEvent
    var possibleCollectables: [Collectable]
    
    init(titel: String, event: OrganizationEvent, possibleCollectables: [Collectable]) {
        self.titel = titel
        self.event = event
        self.possibleCollectables = possibleCollectables
    }
}
