//
//  Model.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

@Observable
class Model {
    var myTickets: [Ticket] = []
    var allEvents: [OrganizationEvent] = []
    
    var solana = SolanaService()
    
    var profile: Profile = Profile()
    
    var collections: [CollectionNFT] = []
    var myCollectables: [Collectable] = []
    
    func returnListSorted(sortOption: SortOptions) -> [OrganizationEvent] {
        switch sortOption {
        case .Popular:
            return allEvents.sorted { $0.popularityScore > $1.popularityScore }
        case .CloseBy:
            return allEvents
        case .Music:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Music}
        case .Sports:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Sports}
        case .ArtsTheatre:
            return allEvents.filter {$0.eventCategory == EventCategoryType.ArtsTheatre}
        case .Conference:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Conference}
        case .Fair:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Fair}
        case .Other:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Other}
        }
    }
    
    func returnClosestTicket() -> Ticket? {
        let futureTickets = myTickets.filter { $0.organizationEvent.startTime > Date() }
        let closestTicket = futureTickets.min(by: { $0.organizationEvent.startTime < $1.organizationEvent.startTime })
        
        return closestTicket
    }
    
    func collectableOwnByMe(collectable: Collectable) -> Bool {
        return true //TODO: Calculate if it is owned by me
    }
}

enum SortOptions: CaseIterable {
    case Popular, CloseBy, Music, Sports, ArtsTheatre, Conference, Fair, Other
}
