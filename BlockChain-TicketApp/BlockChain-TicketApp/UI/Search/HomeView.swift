//
//  HomeView.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    @State private var isEditing = false // State to track if the user is editing
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading) {
                EventSection(sectionName: "Popular Events")
                EventSection(sectionName: "Nearby Event")
                ForEach(EventCategoryType.allCases, id: \.self) { category in
                    EventSection(sectionName: category.rawValue)
                }
            }
        }
    }
}

#Preview {
    HomeView().environment(MockModel() as Model)
}
