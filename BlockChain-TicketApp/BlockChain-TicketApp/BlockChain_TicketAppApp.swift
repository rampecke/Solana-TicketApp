//
//  BlockChain_TicketAppApp.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

@main
struct BlockChain_TicketAppApp: App {
    @State var model: Model = Model()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(model)
        }
    }
}
