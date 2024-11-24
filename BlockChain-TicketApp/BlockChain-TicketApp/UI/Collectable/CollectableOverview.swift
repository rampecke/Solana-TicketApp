//
//  CollectableOverview.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct CollectableOverview: View {
    @Bindable var collectable: Collectable

    var body: some View {
        VStack(spacing: 16) {
            // Card Display
            CollectableCard(collectable: collectable)
            
            Text("\(collectable.price, specifier: "%.2f") SOL")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .padding(3)
                .overlay(
                    RoundedRectangle(cornerRadius: 8) // Use RoundedRectangle for rounded corners
                        .stroke(Color.gray, lineWidth: 1) // Define the border color and thickness
                )
            
            // Conditional Button for Sell or Buy
            Button(action: {
                //TODO: send over solana back to us
            }) {
                Text(collectable.ownedByMe ? "Sell" : "Buy")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("onAccentColor"))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("accentColor"))
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
        }.padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
        .padding(.horizontal)
    }
}

#Preview {
    CollectableOverview(collectable: PreviewModel().getExampleCollectable())
}
