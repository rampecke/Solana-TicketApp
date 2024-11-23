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
                eventDescription: "Experience an electrifying night of jazz music at Madison Square Garden, featuring world-renowned artists and rising stars. This event promises an evening filled with soulful melodies, intricate improvisations, and unforgettable performances that showcase the rich history and evolution of jazz. With state-of-the-art acoustics and a vibrant atmosphere, the venue is set to become a haven for music enthusiasts. Whether you're a lifelong jazz aficionado or a newcomer to the genre, this night is sure to captivate your heart and leave you wanting more.",
                eventCategory: .Music,
                eventName: "Jazz Night at Madison Square Garden"
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 3.8,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 34.0522, longitude: -118.2437),
                nameLocation: "Hollywood Bowl, Los Angeles",
                eventDescription: "Rock legends return to the stage at the iconic Hollywood Bowl for an unforgettable evening of high-energy performances. This outdoor concert will take you on a journey through the greatest rock hits of all time, with dazzling light displays and a lively crowd creating an electrifying atmosphere. Grab your friends, sing along to your favorite tunes, and be part of this legendary night that celebrates the enduring power and spirit of rock music.",
                eventCategory: .Music,
                eventName: "Legends of Rock at the Hollywood Bowl"
            ),

            // Sports Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 5.0,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 51.5074, longitude: -0.1278),
                nameLocation: "Wembley Stadium, London",
                eventDescription: "Get ready for a thrilling Premier League football match at Wembley Stadium, where two of the top-tier teams will battle it out for glory. Fans from around the world will gather to witness world-class players showcase their skills, speed, and strategy on the pitch. The electrifying atmosphere, roaring crowds, and nail-biting action make this event a must-attend for sports enthusiasts. Don't miss the opportunity to cheer for your favorite team and be part of this unforgettable football experience.",
                eventCategory: .Sports,
                eventName: "Premier League Showdown at Wembley"
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.2,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                nameLocation: "Roland Garros, Paris",
                eventDescription: "Join us for an exhilarating day at the French Open, where the world's best tennis players compete for glory on the legendary clay courts of Roland Garros. Witness intense rallies, stunning serves, and unmatched athleticism as the players battle for victory in this prestigious tournament. Whether you're a die-hard tennis fan or new to the sport, the vibrant atmosphere and world-class performances are sure to leave you inspired.",
                eventCategory: .Sports,
                eventName: "French Open at Roland Garros"
            ),

            // Arts & Theatre Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.8,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 40.7580, longitude: -73.9855),
                nameLocation: "Broadway, New York",
                eventDescription: "Step into the magical world of Broadway with a heartwarming musical that blends captivating storytelling, breathtaking performances, and unforgettable music. Set against the backdrop of dazzling sets and costumes, this production brings a tale of love, resilience, and dreams to life. Whether you're a seasoned theatergoer or experiencing Broadway for the first time, this show promises an evening of laughter, tears, and pure entertainment.",
                eventCategory: .ArtsTheatre,
                eventName: "Broadway's Magical Musical Night"
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.0,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 41.9028, longitude: 12.4964),
                nameLocation: "Teatro dell'Opera, Rome",
                eventDescription: "Immerse yourself in the enchanting world of opera at the historic Teatro dell'Opera in Rome. This performance brings together a talented cast of singers, a world-class orchestra, and stunning stage designs to create an unforgettable experience. Let the powerful voices and dramatic storytelling transport you to a realm of passion, heartbreak, and triumph, all set against the backdrop of one of Rome's most iconic cultural landmarks.",
                eventCategory: .ArtsTheatre,
                eventName: "Opera Night at Teatro dell'Opera"
            ),

            // Conference Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 3.5,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .day, value: 1, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194),
                nameLocation: "Moscone Center, San Francisco",
                eventDescription: "Join industry leaders, innovators, and enthusiasts at this year's Tech Conference at the Moscone Center in San Francisco. With keynote speeches from top tech executives, hands-on workshops, and networking opportunities, this event is a hub of cutting-edge ideas and breakthroughs. Explore the latest advancements in artificial intelligence, blockchain, and virtual reality, and connect with like-minded professionals from around the globe.",
                eventCategory: .Conference,
                eventName: "San Francisco Tech Conference"
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.3,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 6, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
                nameLocation: "Tokyo Big Sight, Tokyo",
                eventDescription: "The International Business Summit at Tokyo Big Sight brings together global leaders, entrepreneurs, and innovators to discuss sustainable development and future trends. Featuring insightful panel discussions, interactive workshops, and networking events, this summit is a unique opportunity to gain valuable insights, build connections, and shape the future of business.",
                eventCategory: .Conference,
                eventName: "Tokyo International Business Summit"
            ),

            // Fair Events
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.9,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 5, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 52.5200, longitude: 13.4050),
                nameLocation: "Berlin ExpoCenter, Berlin",
                eventDescription: "The Berlin Artisanal Fair is a celebration of creativity, craftsmanship, and community. Discover unique handmade products, sample delicious local delicacies, and meet talented artisans from around the region. This family-friendly event also features live music, workshops, and activities for all ages, making it a perfect day out for everyone.",
                eventCategory: .Fair,
                eventName: "Berlin Artisanal Fair"
            ),
            OrganizationEvent(
                eventId: UUID(),
                popularityScore: 4.1,
                startTime: Date(),
                endTime: Calendar.current.date(byAdding: .hour, value: 4, to: Date())!,
                location: CLLocationCoordinate2D(latitude: 45.4642, longitude: 9.1900),
                nameLocation: "Fiera Milano, Milan",
                eventDescription: "Step into the glamorous world of fashion at the Milan Fashion Fair, a premier event that showcases the latest trends, designs, and innovations in the fashion industry. From runway shows to interactive exhibits, this event is a feast for the senses. Network with industry professionals, discover new brands, and be inspired by the artistry and creativity on display.",
                eventCategory: .Fair,
                eventName: "Milan Fashion Fair"
            )
        ]
    }
    
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
        
        return Ticket(id: UUID(), ticketName: "Macklemore - The Ben Tour", startTime: startTime, endTime: endTime, ticketType: "Normalprice", seating: Seating(block: "A", row: "1", seat: "15"), location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", orderId: UUID().uuidString)
    }
}
