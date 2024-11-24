//
//  PayView.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 24.11.24.
//

import SwiftUI

struct PayView: View {
    @Environment(\.presentationMode) var presentationMode
    @Bindable var event: OrganizationEvent
    @Environment(Model.self) var model: Model
    
    @State private var selectedSeats: [String: Int] = [
        "Category-1": 0,
        "Category-2": 0,
        "Category-3": 0,
        "Category-4": 0
    ]
    
    private let ticketPrices: [String: Double] = [
        "Category-1": 150.0,
        "Category-2": 100.0,
        "Category-3": 75.0,
        "Category-4": 49.0
    ]
    
    var totalPrice: Double {
        selectedSeats.reduce(0) { total, entry in
            total + (Double(entry.value) * (ticketPrices[entry.key] ?? 0.0))
        }
    }
    
    var hasSelectedTickets: Bool {
        selectedSeats.values.contains { $0 > 0 }
    }
    
    var body: some View {
        VStack {
            Text("Seating Plan")
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            
            Image("simple")
                .resizable()
                .scaledToFit()
                .frame(width: 250)
                .clipShape(Rectangle())
                .cornerRadius(15)
            
            ForEach(ticketPrices.keys.sorted(), id: \.self) { category in
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text(category)
                            .font(.body)
                            .fontWeight(.regular)
                        Text("$\(ticketPrices[category]!, specifier: "%.2f") per ticket")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    // Decrease seats button
                    Button(action: {
                        if selectedSeats[category, default: 0] > 0 {
                            selectedSeats[category, default: 0] -= 1
                        }
                    }) {
                        Image(systemName: "minus")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    
                    Text("\(selectedSeats[category, default: 0])")
                        .font(.body)
                        .frame(width: 30, alignment: .center)
                    
                    // Increase seats button
                    Button(action: {
                        selectedSeats[category, default: 0] += 1
                    }) {
                        Image(systemName: "plus")
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                }
                .padding(.vertical, 5)
            }.padding(.horizontal)
            
            Divider()
                .overlay(Color.gray)
                .padding(.horizontal)
                .frame(height: 1)
            
            Text("Total Price: $\(totalPrice, specifier: "%.2f")")
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.top, 5)
                .padding(.horizontal)
            
            Button(action: {
                Task {
                    do {
                        try await model.buyTicket(event: self.event)
                        presentationMode.wrappedValue.dismiss()
                    } catch {
                        print("Failed to buy ticket: \(error.localizedDescription)")
                        print(error)
                    }
                }
            }) {
                HStack {
                    Text("Buy with")
                        .font(.subheadline)
                        .fontWeight(.bold)
                    Image("SolanaButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50)
                }.foregroundColor(.primary)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.3))
                .cornerRadius(15)
                .padding(.horizontal)
            }.padding(.top, 5)
            .disabled(!hasSelectedTickets)
            .opacity(hasSelectedTickets ? 1.0 : 0.5)
            
        }
    }
}

#Preview {
    PayView(event: MockModel().getExampleTicket().organizationEvent)
}
