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
    
    func returnListSorted(sortOption: SortOptions) -> [OrganizationEvent] {
        return allEvents //TODO: actually sort by the type
    }
}

enum SortOptions: CaseIterable {
    case Popular, CloseBy, Music, Sports, ArtsTheatre, Conference, Fair, Other
}
