//
//  Ticket.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation
import MapKit

@Observable
class Ticket: Identifiable {
    var id: UUID
    var ticketType: String
    var seating: Seating
    var orderId: String
    var organizationEvent: OrganizationEvent
    
    init(id: UUID, ticketType: String, seating: Seating, orderId: String, organisationEvent: OrganizationEvent) {
        self.id = id
        self.ticketType = ticketType
        self.seating = seating
        self.orderId = orderId
        self.organizationEvent = organisationEvent
    }
}
