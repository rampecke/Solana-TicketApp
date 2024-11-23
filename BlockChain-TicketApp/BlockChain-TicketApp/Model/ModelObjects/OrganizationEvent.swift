//
//  Event.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation
import MapKit

@Observable
class OrganizationEvent {
    var eventId: UUID
    var popularityScore: Double
    var startTime: Date
    var endTime: Date
    var location: CLLocationCoordinate2D
    var nameLocation: String;
    var eventDescription: String
    var eventCategory: EventCategoryType
    var eventName: String
    
    init(eventId: UUID, popularityScore: Double, startTime: Date, endTime: Date, location: CLLocationCoordinate2D, nameLocation: String, eventDescription: String, eventCategory: EventCategoryType, eventName: String) {
        self.eventId = eventId
        self.popularityScore = popularityScore
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.nameLocation = nameLocation
        self.eventDescription = eventDescription
        self.eventCategory = eventCategory
        self.eventName = eventName
    }
    
    // Helper function to format the day string
    func formatDayString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
    
    // Helper function to format the time
    func formatTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mma"
        formatter.amSymbol = " AM"
        formatter.pmSymbol = " PM"
        return formatter.string(from: date)
    }
}

enum EventCategoryType{
    case Music, Sports, ArtsTheatre, Conference, Fair
}
