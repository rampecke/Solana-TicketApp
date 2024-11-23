//
//  TicketHeader.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct TicketHeader: View {
    @Bindable var ticket: Ticket
    
    // Helper function to format the day string
    private func formatDayString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
    
    // Helper function to format the time
    private func formatTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mma"
        formatter.amSymbol = " AM"
        formatter.pmSymbol = " PM"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(ticket.ticketName)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                TicketHeaderElement(sfSymbolName: "calendar", elementText: formatDayString(date: ticket.startTime))
                TicketHeaderElement(sfSymbolName: "clock", elementText: formatTime(date: ticket.startTime))
            }.frame(maxWidth: .infinity, alignment: .leading)
        }.padding(10)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(.background)
        ).frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    let model = MockModel()
    
    return TicketHeader(ticket: model.getExampleTicket())
}
