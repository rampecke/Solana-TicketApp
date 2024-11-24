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
    
    @Environment(Model.self) var model: Model
    
    func selectSortOption(eventType: EventCategoryType) -> SortOptions {
        switch eventType {
        case .Music:
            return SortOptions.Music
        case .Sports:
            return SortOptions.Sports
        case .ArtsTheatre:
            return SortOptions.ArtsTheatre
        case .Conference:
            return SortOptions.Conference
        case .Fair:
            return SortOptions.Fair
        case .Other:
            return SortOptions.Other
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading) {
                    if !model.myTickets.isEmpty {
                        HStack{
                            Text("Your next Event is coming")
                                .font(.headline)
                            Spacer()
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        TicketCountdownElement(ticket: model.returnClosestTicket() ?? MockModel().getExampleTicket()).padding(.bottom, 10).padding(.horizontal)
                    }
                    EventSection(sectionName: "Popular Events", sortOption: SortOptions.Popular)
                    EventSection(sectionName: "Nearby Event", sortOption: SortOptions.CloseBy)
                    ForEach(EventCategoryType.allCases, id: \.self) { category in
                        EventSection(sectionName: category.rawValue, sortOption: selectSortOption(eventType: category))
                    }
                }
            }
        }.searchable(text: $searchText)
    }
}

#Preview {
    HomeView().environment(MockModel() as Model)
}
