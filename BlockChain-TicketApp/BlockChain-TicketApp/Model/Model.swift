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
}
