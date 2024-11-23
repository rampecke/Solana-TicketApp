//
//  SectionHeader.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct SectionHeader: View {
    var sectionName: String
    
    var body: some View {
        HStack{
            Text(sectionName)
                .font(.headline)
            Spacer()
            Button(action: {
                //TODO: Add a button with see more functionality
            }, label: {
                Text("See More")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            })
        }.frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
    }
}

#Preview {
    SectionHeader(sectionName: "Popular Events")
}
