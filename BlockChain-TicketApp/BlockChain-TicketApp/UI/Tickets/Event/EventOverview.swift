//
//  EventOverview.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct EventOverview: View {
    @Bindable var organizationEvent: OrganizationEvent
    
    var body: some View {
        ScrollView {
            VStack(spacing:10) {
                ZStack(alignment: .bottom) {
                    Image("ExamplePicture") // TODO: Replace with my image name
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .topLeading)
                        .clipped()
                        .cornerRadius(15)
                    
                    TicketHeader(organizationEvent: organizationEvent)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)
                }.padding(.horizontal)
                
                AboutComponent(organizationEvent: organizationEvent)
                
                MapComponent(organizationEvent: organizationEvent)
            }.padding()
        }
    }
}

#Preview {
    EventOverview(organizationEvent: MockModel().getExampleTicket().organizationEvent)
}
