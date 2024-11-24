//
//  CollectableCard.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 24.11.24.
//

import SwiftUI

struct CollectableCard: View {
    var collectable: Collectable
    
    var body: some View {
        VStack {
            // Square Image
            AsyncImage(url: URL(string: collectable.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray.frame(width: 350, height: 350)
            }.frame(width: 350, height: 350)
                .clipShape(Rectangle())
                .cornerRadius(15)

            // Optional Text or Content Below
            VStack {
                HStack {
                    // NFT Title
                    Text(collectable.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Ownership Status Tag
                    if collectable.ownedByMe {
                        Text("Owned")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.green)
                            .clipShape(Capsule())
                    } else {
                        Text("Not Owned")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.red)
                            .clipShape(Capsule())
                    }
                }
                
                Text("\(collectable.numberInCollection ?? 0)/\(collectable.totalNumberInCollection ?? 0)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
        }
        .frame(maxWidth: .infinity)
    }
}

struct CollectableCardSmall: View {
    var collectable: Collectable
    
    var body: some View {
        VStack {
            // Your Collectable Card View            
            AsyncImage(url: URL(string: collectable.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray.frame(width: 150, height: 150)
            }.frame(width: 150, height: 150)
                .clipShape(Rectangle())
                .cornerRadius(10)
                .opacity(collectable.ownedByMe ? 1 : 0.4)
            
            Text(collectable.title)
                .font(.subheadline)
                .foregroundColor(.primary)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .truncationMode(.tail)
                .frame(maxWidth: .infinity, alignment: .center)
            
            if collectable.ownedByMe {
                Text("Owned")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 150)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.green)
                    .clipShape(Capsule())
                
            } else {
                Text("Not Owned")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.red)
                    .clipShape(Capsule())
            }
        }
        .frame(width: 170) // Size of each collectable card
    }
}

#Preview {
    return VStack {
        CollectableCard(collectable: PreviewModel().getExampleCollectable())
        CollectableCardSmall(collectable: PreviewModel().getExampleCollectable())
    }
}
