//
//  SectionHeader.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct EventSection: View {
    var sectionName: String
    var sortOption: SortOptions
    
    @Environment(Model.self) var model: Model
    
    //Handle show more logic
    @State var showMoreTrue: Bool = false
    
    // Function to filter events based on `showMoreTrue`
    private func filteredEvents() -> [OrganizationEvent] {
        let sortedEvents = model.returnListSorted(sortOption: sortOption)
        return showMoreTrue ? sortedEvents : Array(sortedEvents.prefix(2))
    }
    
    var body: some View {
        VStack {
            HStack{
                Text(sectionName)
                    .font(.headline)
                Spacer()
                Button(action: {
                    showMoreTrue.toggle()
                }, label: {
                    Text("See More")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                })
            }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            LazyVGrid(columns: [
                GridItem(.fixed(170)),
                GridItem(.fixed(170)),
            ], spacing: 10) {
                ForEach(filteredEvents(), id: \.eventId) { event in
                    NavigationLink {
                        EventOverview(organizationEvent: event)
                    } label: {
                        EventCard(organizationEvent: event)
                    }
                }
            }
        }.padding()
            .background(Color.gray.opacity(0.1))
            .cornerRadius(15)
            .padding(.horizontal)
    }
}

#Preview {
    EventSection(sectionName: "Popular Events", sortOption: SortOptions.Popular).environment(MockModel() as Model)
}
