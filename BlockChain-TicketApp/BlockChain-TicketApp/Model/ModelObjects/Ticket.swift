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

// Extension in OrganizationEvent.swift
extension Ticket {
    static func convertFromDtos(ticketDtos: [TicketDto], events: [OrganizationEvent]) -> [Ticket] {
        return ticketDtos.compactMap { dto in
            let event = events.first(where: { $0.eventId == UUID(uuidString: dto.eventId) })
            
            if event == nil {
                return nil
            }
            
            return Ticket(
                id: UUID(uuidString: dto.id)!,
                ticketType: "Normalprice",
                seating: Seating(
                    block: dto.seatingBlock,
                    row: dto.seatingRow,
                    seat: dto.seatingSeat
                ),
                orderId: dto.id,
                organisationEvent: event!
            )
        }
    }
}
