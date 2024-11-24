//
//  TicketOverview.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI
import MapKit

struct TicketOverview: View {
    @Bindable var ticket: Ticket
    
    //Open and close sheet for Ticket
    @State var ticketOpen: Bool = false
    
    init(ticket: Ticket) {
        self.ticket = ticket
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing:10) {
                ZStack(alignment: .bottom) {
                    
                    AsyncImage(url: URL(string: ticket.organizationEvent.imageUrl)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray.frame(width: .infinity, height: 300)
                    }.frame(maxWidth: .infinity, maxHeight: 300, alignment: .topLeading)
                        .clipped()
                        .cornerRadius(15)
                    
                    TicketHeader(organizationEvent: ticket.organizationEvent)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)
                }.padding(.horizontal)
                
                Button(action: {
                    ticketOpen.toggle()
                }) {
                    HStack {
                        Image(systemName: "qrcode")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Show QR Code")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }.foregroundColor(Color("onAccentColor"))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color("accentColor"))
                    .cornerRadius(15)
                    .padding(.horizontal)
                }
                
                AboutComponent(organizationEvent: ticket.organizationEvent)
                
                MapComponent(organizationEvent: ticket.organizationEvent)
            }.padding(.top, 10)
        }.sheet(isPresented: $ticketOpen, content: {
            TicketView(ticket: ticket)
                .presentationDetents([.height(500)])
                .presentationDragIndicator(.visible)
        })
    }
}

#Preview {
    let model = MockModel()
    return TicketOverview(ticket: model.getExampleTicket()).environment(model as Model)
}
