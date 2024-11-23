//
//  ContentView.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct ContentView: View {
    @Environment(Model.self) var model: Model
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            TicketList()
                .tabItem {
                    Label("Tickets", systemImage: "ticket")
                }
            
            CollectableOverview()
                .tabItem {
                    Label("Collection", systemImage: "folder")
                }
            
        }
    }
}

#Preview {
    ContentView().environment(MockModel() as Model)
}
