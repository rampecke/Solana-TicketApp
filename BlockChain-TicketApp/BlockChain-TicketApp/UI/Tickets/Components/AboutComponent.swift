//
//  AboutComponent.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct AboutComponent: View {
    @Bindable var organizationEvent: OrganizationEvent
    
    //Expandable Text
    @State private var isExpanded: Bool = false
    
    var body: some View {
        Group {
            // Title below the ZStack
            Text("About this event")
                .font(.title3)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            //Text(ticket.eventDescription)
            Text(organizationEvent.eventDescription.count > 200 && !isExpanded ? "\(String(organizationEvent.eventDescription.prefix(200)))..." : organizationEvent.eventDescription)
                .font(.body)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .padding(.horizontal)
            if organizationEvent.eventDescription.count > 300 {
                HStack(alignment: .top){
                    Button(action: {
                        isExpanded.toggle()
                    }) {
                        Text(isExpanded ? "Show Less" : "Show More")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("accentColor"))
                    }
                }.padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}

#Preview {
    AboutComponent(organizationEvent: MockModel().getExampleTicket().organizationEvent)
}
