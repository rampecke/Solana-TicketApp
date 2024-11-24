//
//  CollectableView.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 24.11.24.
//

import SwiftUI

struct CollectableView: View {
    @Environment(Model.self) var model: Model
    @State private var showMoreTrue: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(model.collections) { collection in
                        CollectionSection(collection: collection)
                    }
                }
            }
        }
    }
}

#Preview {
    CollectableView().environment(MockModel() as Model)
}
