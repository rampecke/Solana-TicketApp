//
//  TicketHeaderElement.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct TicketHeaderElement: View {
    var sfSymbolName: String
    var elementText: String
    
    var body: some View {
        HStack {
            Image(systemName: sfSymbolName)
                .font(.subheadline) //
                .foregroundColor(.secondary)

            Text(elementText)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }.padding(3)
    }
}

#Preview {
    TicketHeaderElement(sfSymbolName: "map", elementText: "Event Details")
}
