//
//  CollectableCard.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 24.11.24.
//

import SwiftUI

struct CollectableCard: View {
    @Bindable var collectable: Collectable
    
    var body: some View {
        VStack {
            // Square Image
            Image("ExampleNFT") //TODO: Use NFT Url
                .resizable()
                .scaledToFit()
                .frame(width: 350, height: 350)
                .clipShape(Rectangle())
                .cornerRadius(15)

            // Optional Text or Content Below
            HStack {
                VStack {
                    Text(collectable.titel)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("\(collectable.numberInCollection ?? 0)/\(collectable.totalNumberInCollection ?? 0)")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }.frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    CollectableCard(collectable: MockModel().getExampleCollectable())
}
