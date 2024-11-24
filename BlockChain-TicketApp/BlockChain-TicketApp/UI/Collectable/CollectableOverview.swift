//
//  CollectableOverview.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct CollectableOverview: View {
    var body: some View {
        CollectableCard(collectable: MockModel().getExampleCollectable())
    }
}

#Preview {
    CollectableOverview()
}
