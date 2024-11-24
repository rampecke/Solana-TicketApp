//
//  TicketCountdown.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct TicketCountdown: View {
    @Bindable var ticket: Ticket
    @Binding var remaningTime: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(ticket.organizationEvent.eventName)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Text(remaningTime)
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }.padding(10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
        ).frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    @State var remaning: String = "10:08:09:11"
    return TicketCountdown(ticket: PreviewModel().getExampleTicket(), remaningTime: $remaning)
}
