//
//  MockModel.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation
import MapKit

class MockModel: Model {
    override init() {
        super.init()
        
        self.allEvents = [
            // Music Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.5,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
                nameLocation: "Madison Square Garden, New York",
                eventDescription: "Experience an electrifying night of jazz music at Madison Square Garden, featuring world-renowned artists and rising stars...",
                eventCategory: .Music,
                eventName: "Jazz Night at Madison Square Garden",
                organizerName: "NYC Jazz Club",
                imageUrl: ""
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 3.8,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
                nameLocation: "Hollywood Bowl, Los Angeles",
                eventDescription: "Rock legends return to the stage at the iconic Hollywood Bowl for an unforgettable evening of high-energy performances...",
                eventCategory: .Music,
                eventName: "Legends of Rock at the Hollywood Bowl",
                organizerName: "LA Rock Association",
                imageUrl: ""
            ),
            
            // Sports Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 5.0,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278),
                nameLocation: "Wembley Stadium, London",
                eventDescription: "Get ready for a thrilling Premier League football match at Wembley Stadium...",
                eventCategory: .Sports,
                eventName: "Premier League Showdown at Wembley",
                organizerName: "English Premier League",
                imageUrl: ""
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.2,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                nameLocation: "Roland Garros, Paris",
                eventDescription: "Join us for an exhilarating day at the French Open...",
                eventCategory: .Sports,
                eventName: "French Open at Roland Garros",
                organizerName: "French Tennis Federation",
                imageUrl: ""
            ),
            
            // Arts & Theatre Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.8,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 40.7580, longitude: -73.9855),
                nameLocation: "Broadway, New York",
                eventDescription: "Step into the magical world of Broadway with a heartwarming musical...",
                eventCategory: .ArtsTheatre,
                eventName: "Broadway's Magical Musical Night",
                organizerName: "Broadway Performers Inc.",
                imageUrl: ""
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.0,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964),
                nameLocation: "Teatro dell'Opera, Rome",
                eventDescription: "Immerse yourself in the enchanting world of opera at the historic Teatro dell'Opera...",
                eventCategory: .ArtsTheatre,
                eventName: "Opera Night at Teatro dell'Opera",
                organizerName: "Rome Opera Society",
                imageUrl: ""
            ),
            
            // Conference Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 3.5,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                nameLocation: "Moscone Center, San Francisco",
                eventDescription: "Join industry leaders, innovators, and enthusiasts at this year's Tech Conference...",
                eventCategory: .Conference,
                eventName: "San Francisco Tech Conference",
                organizerName: "Tech Innovators Network",
                imageUrl: ""
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.3,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 6, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
                nameLocation: "Tokyo Big Sight, Tokyo",
                eventDescription: "The International Business Summit at Tokyo Big Sight brings together global leaders...",
                eventCategory: .Conference,
                eventName: "Tokyo International Business Summit",
                organizerName: "Global Business Forum",
                imageUrl: ""
            ),
            
            // Fair Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.9,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 5, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050),
                nameLocation: "Berlin ExpoCenter, Berlin",
                eventDescription: "The Berlin Artisanal Fair is a celebration of creativity, craftsmanship, and community...",
                eventCategory: .Fair,
                eventName: "Berlin Artisanal Fair",
                organizerName: "Berlin Artisans Guild",
                imageUrl: ""
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.1,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 4, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 45.4642, longitude: 9.1900),
                nameLocation: "Fiera Milano, Milan",
                eventDescription: "Step into the glamorous world of fashion at the Milan Fashion Fair...",
                eventCategory: .Fair,
                eventName: "Milan Fashion Fair",
                organizerName: "Milan Fashion Group",
                imageUrl: ""
            )
        ]
        
        let calendar = Calendar.current
        
        let startTimeComponents = DateComponents(year: 2024, month: 11, day: 24, hour: 10, minute: 0)
        guard let startTime = calendar.date(from: startTimeComponents) else {
            fatalError("Failed to create start date")
        }
        let endTimeComponents = DateComponents(year: 2024, month: 11, day: 25, hour: 22, minute: 0)
        guard let endTime = calendar.date(from: endTimeComponents) else {
            fatalError("Failed to create start date")
        }
        
        self.myTickets = [
            Ticket(id: UUID(), ticketType: "Normalprice", seating: Seating(block: "A", row: "1", seat: "15"), orderId: UUID().uuidString, organisationEvent: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime: startTime, endTime: endTime, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "Olypia Zentrum", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: "")),
            Ticket(id: UUID(), ticketType: "Studentprice", seating: Seating(block: nil, row: nil, seat: nil), orderId: UUID().uuidString, organisationEvent: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime: startTime, endTime: endTime, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Join us at Hackatum, the ultimate hackathon held at TUM! This thrilling event brings together tech enthusiasts, students, and professionals for an intense weekend of innovation and problem-solving. Collaborate with like-minded individuals, tackle real-world challenges, and showcase your skills in a high-energy environment. With expert mentors, exciting workshops, and great networking opportunities, Hackatum is your chance to create, learn, and compete. Don't miss out—get your ticket today!", eventCategory: EventCategoryType.Music, eventName: "Hackatum", organizerName: "Sebis-Tum", imageUrl: ""))
        ]
    }
    
    func getExampleTicket() -> Ticket {
        let calendar = Calendar.current
        
        let startTimeComponents = DateComponents(year: 2024, month: 11, day: 24, hour: 10, minute: 0)
        guard let startTime = calendar.date(from: startTimeComponents) else {
            fatalError("Failed to create start date")
        }
        let endTimeComponents = DateComponents(year: 2024, month: 11, day: 25, hour: 22, minute: 0)
        guard let endTime = calendar.date(from: endTimeComponents) else {
            fatalError("Failed to create start date")
        }
        
        return Ticket(id: UUID(), ticketType: "Normalprice", seating: Seating(block: "A", row: "1", seat: "15"), orderId: UUID().uuidString, organisationEvent: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime: startTime, endTime: endTime, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: ""))
    }
}
