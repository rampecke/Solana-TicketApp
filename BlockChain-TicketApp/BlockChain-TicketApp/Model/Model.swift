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
    
    var solana = SolanaService()
    
    var profile: Profile = Profile()
    
    var collections: [CollectionNFT] = []
    var myCollectables: [Collectable] = []
    
    let apiEndpint: String = "https://agricultural-ranking-study-asks.trycloudflare.com"
    
    func returnListSorted(sortOption: SortOptions) -> [OrganizationEvent] {
        switch sortOption {
        case .Popular:
            return allEvents.sorted { $0.popularityScore > $1.popularityScore }
        case .CloseBy:
            return allEvents
        case .Music:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Music}
        case .Sports:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Sports}
        case .ArtsTheatre:
            return allEvents.filter {$0.eventCategory == EventCategoryType.ArtsTheatre}
        case .Conference:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Conference}
        case .Fair:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Fair}
        case .Other:
            return allEvents.filter {$0.eventCategory == EventCategoryType.Other}
        }
    }
    
    func returnClosestTicket() -> Ticket? {
        let futureTickets = myTickets.filter { $0.organizationEvent.startTime > Date() }
        let closestTicket = futureTickets.min(by: { $0.organizationEvent.startTime < $1.organizationEvent.startTime })
        
        return closestTicket
    }
    
    func collectableOwnByMe(collectable: Collectable) -> Bool {
        return true //TODO: Calculate if it is owned by me
    }
    
    func fetchEvents() async throws -> [OrganizationEvent] {
        // API endpoint
        let url = URL(string: "\(apiEndpint)/events")!
        
        // Use URLSession's async method to fetch data
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode the JSON data
        let events = try JSONDecoder().decode([EventDto].self, from: data)
        
        return OrganizationEvent.convertFromDtos(eventDtos: events)
    }
    
    func fetchMyTickets() async throws -> [Ticket] {
        let url = URL(string: "\(apiEndpint)/tickets?boughtBy=" + profile.getPublicKey())!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let tickets = try JSONDecoder().decode([TicketDto].self, from: data)
        
        return Ticket.convertFromDtos(ticketDtos: tickets, events: self.allEvents)
    }
    
    func buyTicket(event: OrganizationEvent) async throws {
        let url = URL(string: "\(apiEndpint)/events/\(event.eventId.uuidString)/buy")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "walletAddress": profile.getPublicKey()
        ]
        
        let encoded = try JSONSerialization.data(withJSONObject: parameters, options: [])

        
        let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
        
        let ticket = try JSONDecoder().decode(TicketDto.self, from: data)
        
        myTickets.append(Ticket.convertFromDtos(ticketDtos: [ticket], events: self.allEvents)[0])
    }
    
    func claimTicket(ticket: Ticket) async throws {
        let url = URL(string: "\(apiEndpint)/tickets/\(ticket.id.uuidString)/claim")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let parameters: [String: Any] = [
            "walletAddress": profile.getPublicKey()
        ]
        
        let encoded = try JSONSerialization.data(withJSONObject: parameters, options: [])

        
        let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
        
        let collectable = try JSONDecoder().decode(CollectableDto.self, from: data)
        
        myCollectables.append(Collectable.convertFromDtos(collectableDtos: [collectable], myAddress: profile.getPublicKey())[0])
    }
    
    func fetchCollections() async throws -> [CollectionNFT] {
        let url = URL(string: "\(apiEndpint)/collections")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let collections = try JSONDecoder().decode([CollectionDto].self, from: data)
        
        return CollectionNFT.convertFromDtos(collectionDtos: collections, myAddress: profile.getPublicKey());
    }
    
    func authenticate() async throws {
        let auth = try await solana.auth()
        
        profile.name = auth.name
        profile.profilePictureUrl = auth.profileImage
        profile.keypair = auth.key
        
        profile.signedIn = true
        
        // Fetch the events
        allEvents = try await fetchEvents()
        myTickets = try await fetchMyTickets()
        collections = try await fetchCollections()
    }
}

enum SortOptions: CaseIterable {
    case Popular, CloseBy, Music, Sports, ArtsTheatre, Conference, Fair, Other
}
