//
//  EventCard.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct EventCard: View {
    @Bindable var organizationEvent: OrganizationEvent
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Image("ExamplePicture") // TODO: Replace with my image name
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 150, maxHeight: 200)
                .clipped()
                .cornerRadius(15)
            Text(organizationEvent.eventName)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                TicketHeaderElement(sfSymbolName: "calendar", elementText: organizationEvent.formatDayString(date: organizationEvent.startTime))
                TicketHeaderElement(sfSymbolName: "clock", elementText: organizationEvent.formatTime(date: organizationEvent.startTime))
        }.frame(maxWidth: 150, alignment: .leading)
        .padding(10)
    }
}

#Preview {
    let model = MockModel()
    return EventCard(organizationEvent: model.allEvents[0])
}
