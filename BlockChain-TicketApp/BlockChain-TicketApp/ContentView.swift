//
//  ContentView.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI
import SolanaSwift

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
            
            CollectableView()
                .tabItem {
                    Label("Collection", systemImage: "folder")
                }
            
        }
    }
}


#Preview {
    ContentView().environment(PreviewModel() as Model)
}
