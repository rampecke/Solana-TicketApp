//
//  TicketOverview.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI
import MapKit
import Kingfisher

struct TicketOverview: View {
    @Bindable var ticket: Ticket
    @Environment(Model.self) var model: Model
    
    // Open and close sheet for Ticket
    @State var ticketOpen: Bool = false
    
    init(ticket: Ticket) {
        self.ticket = ticket
    }
    
    var isEventOver: Bool {
        // Check if the event's end time is in the past
        return ticket.organizationEvent.startTime < Date()
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ZStack(alignment: .bottom) {
                    KFImage(URL(string: ticket.organizationEvent.imageUrl))
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .topLeading)
                        .clipped()
                        .cornerRadius(15)
                    
                    TicketHeader(organizationEvent: ticket.organizationEvent)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 20)
                }.padding(.horizontal)
                
                if isEventOver {
                    Button(action: {
                        Task {
                            do {
                                try await model.claimTicket(ticket: ticket)
                            } catch {
                                print("Failed to claim ticket: \(error.localizedDescription)")
                                print(error)
                            }
                        }
                    }) {
                        HStack {
                            Image(systemName: "star.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                            
                            Text("Claim Collectable")
                                .font(.subheadline)
                                .fontWeight(.bold)
                        }.foregroundColor(Color("onAccentColor"))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("accentColor"))
                            .cornerRadius(15)
                            .padding(.horizontal)
                    }
                } else {
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
                }
                
                AboutComponent(organizationEvent: ticket.organizationEvent)
                if (!isEventOver) {
                    MapComponent(organizationEvent: ticket.organizationEvent)
                }
            }.padding(.top, 10)
        }.sheet(isPresented: $ticketOpen, content: {
            TicketView(ticket: ticket)
                .presentationDetents([.height(500)])
                .presentationDragIndicator(.visible)
        })
    }
}


#Preview {
    let model = PreviewModel()
    return TicketOverview(ticket: model.getExampleTicket()).environment(model as Model)
}
