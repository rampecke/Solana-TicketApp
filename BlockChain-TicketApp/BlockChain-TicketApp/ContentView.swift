//
//  ContentView.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TicketOverview(ticket: MockModel().getExampleTicket()) //Exchange for a list of tickets
                .tabItem {
                    Label("Tickets", systemImage: "ticket")
                }
        }
    }
}

#Preview {
    ContentView()
}
