//
//  BlockChain_TicketAppApp.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

@main
struct BlockChain_TicketAppApp: App {
    //@State var model: Model = Model() //TODO: Uncomment as soon as blockchain is connected
    @State var model: Model = MockModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environment(model)
        }
    }
}
