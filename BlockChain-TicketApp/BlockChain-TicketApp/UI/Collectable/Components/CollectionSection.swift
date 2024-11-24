//
//  CollectionSection.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 24.11.24.
//

import SwiftUI
import MapKit

struct CollectionSection: View {
    @Bindable var collection: CollectionNFT
    
    var body: some View {
        VStack {
            HStack{
                Text(collection.titel)
                    .font(.headline)
            }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            LazyVGrid(columns: [
                GridItem(.fixed(170)),
                GridItem(.fixed(170)),
            ], spacing: 10) {
                ForEach(collection.possibleCollectables) { collectable in
                    CollectableCardSmall(collectable: collectable)
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    CollectionSection(collection: CollectionNFT(titel: "More - Macklemore", event: OrganizationEvent(eventId: UUID(), popularityScore: 4.8, startTime:  Date(), endTime: Calendar.current.date(byAdding: .hour, value: 3, to: Date())!, location: CLLocationCoordinate2D(latitude: 48.262756, longitude:  11.668856), nameLocation: "TUM", eventDescription: "Get ready for an unforgettable night as Grammy-winning artist Macklemore takes the stage! Known for his electrifying performances and chart-topping hits like Thrift Shop, Can't Hold Us, and Glorious, Macklemore brings his unique blend of hip-hop, soul, and raw energy to the live concert experience. Join thousands of fans for an evening filled with infectious beats, heartfelt lyrics, and the kind of energy that only Macklemore can deliver. Whether you're a longtime fan or discovering his music for the first time, this concert is a celebration of individuality, passion, and community.", eventCategory: EventCategoryType.Music, eventName: "Macklemore - The Ben Tour", organizerName: "Macklemore", imageUrl: ""), possibleCollectables: [MockModel().getExampleCollectable(), MockModel().getExampleCollectable(), MockModel().getExampleCollectable(), MockModel().getExampleCollectable2()]))
}
