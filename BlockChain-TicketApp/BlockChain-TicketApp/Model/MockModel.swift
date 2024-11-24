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
        
        self.profile = Profile(name: "Simon Osterlehner", profilePictureUrl: "ExamplePicture")
        
        self.collections = [CollectionNFT(titel: "More - Macklemore", event: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime:  Date(), endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: ""), possibleCollectables: [self.getExampleCollectable(), self.getExampleCollectable2(), self.getExampleCollectable(), self.getExampleCollectable2(),self.getExampleCollectable(), self.getExampleCollectable2()]), CollectionNFT(titel: "More - Macklemore", event: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime:  Date(), endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: ""), possibleCollectables: [self.getExampleCollectable(), self.getExampleCollectable2(), self.getExampleCollectable(), self.getExampleCollectable2()])]
        
        self.allEvents = [
            // Music Events
            OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime:  Date(), endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: ""),
            OrganizationEvent(
                    eventId: UUID(),
                    popularityScore: 4.5,
                    startTime: Date(),
                    endTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                    location: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
                    nameLocation: "Madison Square Garden, New York",
                    eventDescription: "Immerse yourself in a soulful night of smooth melodies and electrifying performances as the biggest names in jazz gather at Madison Square Garden. From toe-tapping classics to modern improvisations, this event promises an unforgettable musical journey for jazz enthusiasts and newcomers alike. Don’t miss this chance to witness Grammy-winning artists and rising stars share the stage in one of the world's most iconic venues.",
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
                    eventDescription: "Prepare for an epic night as legendary rock bands take the stage at the Hollywood Bowl. With electrifying guitar solos, powerful vocals, and unforgettable anthems, this concert will have you singing and dancing under the stars. Celebrate decades of rock history with iconic bands delivering a high-energy performance in the heart of Los Angeles.",
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
                    eventDescription: "Join thousands of football fans at Wembley Stadium for an exhilarating Premier League match. Feel the excitement as two top teams battle for glory in one of the world's most prestigious arenas. With unmatched energy from the crowd, world-class talent on the pitch, and high stakes, this is football at its finest.",
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
                    eventDescription: "Experience the thrill of live tennis at the French Open in Paris. Witness world-class athletes compete on the iconic clay courts of Roland Garros in an atmosphere charged with energy and passion. From dramatic rallies to breathtaking match points, every moment promises to be unforgettable.",
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
                    eventDescription: "Step into the enchanting world of Broadway with this critically acclaimed musical. Featuring captivating performances, stunning set designs, and a story that will tug at your heartstrings, this show is a must-see for fans of live theatre. Prepare to laugh, cry, and cheer as the magic of Broadway comes to life on stage.",
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
                    eventDescription: "Immerse yourself in the grandeur of opera at Teatro dell'Opera in Rome. Enjoy an evening of soaring arias, breathtaking costumes, and an unforgettable story performed by some of the world's most talented opera singers. This historic venue provides the perfect backdrop for an evening of cultural and artistic excellence.",
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
                    eventDescription: "Discover the future of technology at the San Francisco Tech Conference. Join industry leaders, innovative startups, and passionate enthusiasts as they explore advancements in AI, blockchain, and sustainable tech. With keynote speakers, hands-on workshops, and networking opportunities, this conference is your gateway to the cutting edge of innovation.",
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
                    eventDescription: "Connect with global leaders, entrepreneurs, and innovators at the Tokyo International Business Summit. Discuss emerging market trends, sustainable business practices, and strategies for success in a rapidly evolving world. With panels led by renowned experts and opportunities to network with decision-makers, this summit is a must for forward-thinking professionals.",
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
                    eventDescription: "Celebrate creativity and craftsmanship at the Berlin Artisanal Fair. Explore handmade goods, culinary delights, and artistic creations from local and international artisans. Whether you’re looking for unique gifts or inspiration, this fair offers something for everyone, along with live workshops and cultural performances.",
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
                    eventDescription: "Experience the glamour and innovation of the fashion world at the Milan Fashion Fair. Featuring collections from top designers and emerging talent, this event highlights the latest trends and timeless elegance. Enjoy runway shows, interactive exhibitions, and exclusive previews of the upcoming season's must-have styles.",
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
        
        let startTimeComponents2 = DateComponents(year: 2024, month: 11, day: 20, hour: 10, minute: 0)
        guard let startTime2 = calendar.date(from: startTimeComponents2) else {
            fatalError("Failed to create start date")
        }
        let endTimeComponents2 = DateComponents(year: 2024, month: 11, day: 20, hour: 22, minute: 0)
        guard let endTime2 = calendar.date(from: endTimeComponents2) else {
            fatalError("Failed to create start date")
        }
        
        self.myTickets = [
            Ticket(id: UUID(), ticketType: "Normalprice", seating: Seating(block: "A", row: "1", seat: "15"), orderId: UUID().uuidString, organisationEvent: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime: startTime, endTime: endTime, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "Olypia Zentrum", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: "")),
            Ticket(id: UUID(), ticketType: "Studentprice", seating: Seating(block: nil, row: nil, seat: nil), orderId: UUID().uuidString, organisationEvent: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime: startTime2, endTime: endTime2, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Join us at Hackatum, the ultimate hackathon held at TUM! This thrilling event brings together tech enthusiasts, students, and professionals for an intense weekend of innovation and problem-solving. Collaborate with like-minded individuals, tackle real-world challenges, and showcase your skills in a high-energy environment. With expert mentors, exciting workshops, and great networking opportunities, Hackatum is your chance to create, learn, and compete. Don't miss out—get your ticket today!", eventCategory: EventCategoryType.Music, eventName: "Hackatum", organizerName: "Sebis-Tum", imageUrl: ""))
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
    
    func getExampleCollectable() -> Collectable {
        let calendar = Calendar.current
        
        let startTimeComponents = DateComponents(year: 2024, month: 11, day: 24, hour: 10, minute: 0)
        guard let startTime = calendar.date(from: startTimeComponents) else {
            fatalError("Failed to create start date")
        }
        let endTimeComponents = DateComponents(year: 2024, month: 11, day: 25, hour: 22, minute: 0)
        guard let endTime = calendar.date(from: endTimeComponents) else {
            fatalError("Failed to create start date")
        }
        
        return Collectable(uuid: UUID(), title: "Macklemore D-Tour", collection: CollectionNFT(titel: "More - Macklemore", event: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime: startTime, endTime: endTime, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: ""), possibleCollectables: []), imageUrl: "", price: 3.115, numberInCollection: 155, totalNumberInCollection: 2057, ownedByMe: true)
    }
    
    func getExampleCollectable2() -> Collectable {
        let calendar = Calendar.current
        
        let startTimeComponents = DateComponents(year: 2024, month: 11, day: 24, hour: 10, minute: 0)
        guard let startTime = calendar.date(from: startTimeComponents) else {
            fatalError("Failed to create start date")
        }
        let endTimeComponents = DateComponents(year: 2024, month: 11, day: 25, hour: 22, minute: 0)
        guard let endTime = calendar.date(from: endTimeComponents) else {
            fatalError("Failed to create start date")
        }
        
        return Collectable(uuid: UUID(), title: "Macklemore D-Tour", collection: CollectionNFT(titel: "More - Macklemore", event: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime: startTime, endTime: endTime, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: ""), possibleCollectables: []), imageUrl: "", price: 3.115, numberInCollection: 155, totalNumberInCollection: 2057, ownedByMe: false)
    }
}
