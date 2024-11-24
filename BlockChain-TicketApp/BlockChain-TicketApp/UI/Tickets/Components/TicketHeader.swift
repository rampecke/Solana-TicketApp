//
//  TicketHeader.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct TicketHeader: View {
    @Bindable var organizationEvent: OrganizationEvent
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(organizationEvent.eventName)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                TicketHeaderElement(sfSymbolName: "calendar", elementText: organizationEvent.formatDayString(date: organizationEvent.startTime))
                TicketHeaderElement(sfSymbolName: "clock", elementText: organizationEvent.formatTime(date: organizationEvent.startTime))
            }.frame(maxWidth: .infinity, alignment: .leading)
        }.padding(10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
        ).frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let model = MockModel()
    
    return TicketHeader(organizationEvent: model.getExampleTicket().organizationEvent)
}
