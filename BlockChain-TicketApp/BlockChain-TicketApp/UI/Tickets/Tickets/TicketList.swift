//
//  TicketList.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct TicketList: View {
    @Environment(Model.self) var model: Model
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 10){
                    ForEach(model.myTickets) { ticket in
                        NavigationLink {
                            TicketOverview(ticket: ticket)
                        } label: {
                            TicketCountdownElement(ticket: ticket).padding(.horizontal)
                        }
                    }
                }
            }
        }.overlay {
            if model.myTickets.isEmpty {
                ContentUnavailableView {
                    Label("No Tickets", systemImage: "ticket")
                } description: {
                    Text("Go to the Search page and get your tickets.")
                }
            }
        }
    }
}

#Preview {
    TicketList().environment(PreviewModel() as Model)
}
