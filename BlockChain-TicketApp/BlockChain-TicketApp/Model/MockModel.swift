//
//  MockModel.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation
import MapKit

class MockModel: Model {
    func getExampleTicket() -> Ticket {
        let calendar = Calendar.current
        
        let startTimeComponents = DateComponents(year: 2024, month: 11, day: 20, hour: 20, minute: 0)
        guard let startTime = calendar.date(from: startTimeComponents) else {
            fatalError("Failed to create start date")
        }
        let endTimeComponents = DateComponents(year: 2024, month: 11, day: 20, hour: 22, minute: 0)
        guard let endTime = calendar.date(from: endTimeComponents) else {
            fatalError("Failed to create start date")
        }
        
        return Ticket(id: UUID(), ticketName: "Macklemore - The Ben Tour", startTime: startTime, endTime: endTime, ticketType: "Normalprice", seating: Seating(block: "A", row: "1", seat: "15"), location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), eventDescription: "A night of amazing music with Macklemore.", orderId: UUID().uuidString)
    }
}
