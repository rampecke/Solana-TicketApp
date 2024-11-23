//
//  SectionHeader.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct EventSection: View {
    var sectionName: String
    @Environment(Model.self) var model: Model
    
    var body: some View {
        VStack {
            HStack{
                Text(sectionName)
                    .font(.headline)
                Spacer()
                Button(action: {
                    //TODO: Functionality
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
                EventCard(organizationEvent: model.allEvents[0])
                EventCard(organizationEvent: model.allEvents[1])
                //TODO: Filter list for what is in this section
            }.padding(.horizontal)
        }
    }
}

#Preview {
    EventSection(sectionName: "Popular Events").environment(MockModel() as Model)
}
