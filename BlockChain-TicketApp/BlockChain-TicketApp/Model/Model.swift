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
    
    var profile: Profile = Profile(name: "", profilePictureUrl: "")
    
    func returnListSorted(sortOption: SortOptions) -> [OrganizationEvent] {
        return allEvents //TODO: actually sort by the type
    }
    
    func returnClosestTicket() -> Ticket? {
        let futureTickets = myTickets.filter { $0.organizationEvent.startTime > Date() }
        let closestTicket = futureTickets.min(by: { $0.organizationEvent.startTime < $1.organizationEvent.startTime })
        
        return closestTicket
    }
}

enum SortOptions: CaseIterable {
    case Popular, CloseBy, Music, Sports, ArtsTheatre, Conference, Fair, Other
}
