//
//  SeatingElement.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct SeatingElement: View {
    var heading: String
    var seatingValue: String
    
    var body: some View {
        VStack {
            Text(heading)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
            Text(seatingValue)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .frame(minWidth: 60)
        .padding(5)
    }
}

#Preview {
    SeatingElement(heading: "Seat", seatingValue: "12")
}
