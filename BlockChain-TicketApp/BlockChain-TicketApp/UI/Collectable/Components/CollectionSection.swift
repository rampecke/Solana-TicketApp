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
    
    private func sortedCollectables() -> [Collectable] {
        let ownedCollectables = collection.possibleCollectables.filter { $0.ownedByMe }
        let nonOwnedCollectables = collection.possibleCollectables.filter { !$0.ownedByMe}

        return ownedCollectables + nonOwnedCollectables
    }
    
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
                ForEach(sortedCollectables()) { collectable in
                    NavigationLink {
                        CollectableOverview(collectable: collectable)
                    } label: {
                        CollectableCardSmall(collectable: collectable)
                    }
                }
            }
        }.padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

#Preview {
    CollectionSection(collection: MockModel().collections[0])
}
