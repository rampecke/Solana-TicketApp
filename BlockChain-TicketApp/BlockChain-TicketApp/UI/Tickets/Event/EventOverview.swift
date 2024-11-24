//
//  EventOverview.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI
import Kingfisher

struct EventOverview: View {
    @Bindable var organizationEvent: OrganizationEvent
    
    @State var buyOpen: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing:10) {
                ZStack(alignment: .bottom) {
                    KFImage(URL(string: organizationEvent.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .topLeading)
                        .clipped()
                        .cornerRadius(15)
                    
                    TicketHeader(organizationEvent: organizationEvent)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)
                }.padding(.horizontal)
                
                Button(action: {
                    buyOpen.toggle()
                }) {
                    HStack {
                        Image(systemName: "ticket")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Buy tickets - from \(organizationEvent.returnCheapestPrice())€")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }.foregroundColor(Color("onAccentColor"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("accentColor"))
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
                
                AboutComponent(organizationEvent: organizationEvent)
                
                MapComponent(organizationEvent: organizationEvent)
            }.padding()
        }.sheet(isPresented: $buyOpen, content: {
            PayView(event: organizationEvent)
                .presentationDetents([.height(650)])
                .presentationDragIndicator(.visible)
        })
    }
}

#Preview {
    EventOverview(organizationEvent: PreviewModel().getExampleTicket().organizationEvent)
}
