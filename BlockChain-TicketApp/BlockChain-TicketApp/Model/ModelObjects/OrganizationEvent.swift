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
    var organizerName: String
    var imageUrl: String
    
    init(eventId: UUID, popularityScore: Double, startTime: Date, endTime: Date, location: CLLocationCoordinate2D, nameLocation: String, eventDescription: String, eventCategory: EventCategoryType, eventName: String, organizerName: String, imageUrl: String) {
        self.eventId = eventId
        self.popularityScore = popularityScore
        self.startTime = startTime
        self.endTime = endTime
        self.location = location
        self.nameLocation = nameLocation
        self.eventDescription = eventDescription
        self.eventCategory = eventCategory
        self.eventName = eventName
        self.organizerName = organizerName
        self.imageUrl = imageUrl
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
    
    //TODO: Needs to return a real price
    func returnCheapestPrice() -> Int {
        return 49
    }
}

public enum EventCategoryType: String, CaseIterable, Codable {
    case Music = "Music"
    case Sports = "Sports"
    case ArtsTheatre = "ArtsTheatre"
    case Conference = "Conference"
    case Fair = "Fair"
    case Other = "Other"
}

// Extension in OrganizationEvent.swift
extension OrganizationEvent {
    static func convertFromDtos(eventDtos: [EventDto]) -> [OrganizationEvent] {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        
        return eventDtos.compactMap { dto in
            guard let startDate = dateFormatter.date(from: dto.startTime),
                  let endDate = dateFormatter.date(from: dto.endTime) else {
                return nil
            }
            
            return OrganizationEvent(
                eventId: UUID(uuidString: dto.id)!,
                popularityScore: 0.0, // Default value, update as needed
                startTime: startDate,
                endTime: endDate,
                location: CLLocationCoordinate2D(latitude: CLLocationDegrees(dto.locationLatitude),
                                                 longitude: CLLocationDegrees(dto.locationLongitude)),
                nameLocation: dto.nameLocation,
                eventDescription: dto.eventDescription,
                eventCategory: dto.eventCategory,
                eventName: dto.eventName,
                organizerName: dto.organizerName,
                imageUrl: dto.imageUrl
            )
        }
    }
}
