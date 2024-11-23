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
    
    //Expandable Text
    @State private var isExpanded: Bool = false
    
    init(ticket: Ticket) {
        self.ticket = ticket
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing:10) {
                ZStack(alignment: .bottom) {
                    Image("ExamplePicture") // Replace with your image name
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .topLeading)
                        .clipped()
                        .cornerRadius(15)
                    
                    TicketHeader(ticket: ticket)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)
                }.padding(.horizontal)
                
                // Title below the ZStack
                Text("About this event")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                //Text(ticket.eventDescription)
                Text(ticket.eventDescription.count > 200 && !isExpanded ? "\(String(ticket.eventDescription.prefix(200)))..." : ticket.eventDescription)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                if ticket.eventDescription.count > 300 {
                    HStack(alignment: .top){
                        Button(action: {
                            isExpanded.toggle()
                        }) {
                            Text(isExpanded ? "Show Less" : "Show More")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                    }.padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                //Map
                Map{
                    Marker("Location", coordinate: ticket.location)
                }.frame(height: 300)
                .cornerRadius(15)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    let model = MockModel()
    return TicketOverview(ticket: model.getExampleTicket())
}
