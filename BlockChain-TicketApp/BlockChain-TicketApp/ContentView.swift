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
            HomeView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            TicketOverview(ticket: MockModel().getExampleTicket())
                .tabItem {
                    Label("Tickets", systemImage: "ticket")
                }
        }
    }
}

#Preview {
    ContentView()
}
