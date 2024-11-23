//
//  Ticket.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation
import MapKit

@Observable
class Ticket {
    var id: UUID
    var ticketName: String
    var startTime: Date
    var endTime: Date
    var ticketType: String
    var seating: Seating
    var location: CLLocationCoordinate2D
    var nameLocation: String;
    var eventDescription: String
    var orderId: String
    
    init(id: UUID, ticketName: String, startTime: Date, endTime: Date, ticketType: String, seating: Seating, location: CLLocationCoordinate2D, nameLocation: String, eventDescription: String, orderId: String) {
        self.id = id
        self.ticketName = ticketName
        self.startTime = startTime
        self.endTime = endTime
        self.ticketType = ticketType
        self.seating = seating
        self.location = location
        self.nameLocation = nameLocation
        self.eventDescription = eventDescription
        self.orderId = orderId
    }
}
