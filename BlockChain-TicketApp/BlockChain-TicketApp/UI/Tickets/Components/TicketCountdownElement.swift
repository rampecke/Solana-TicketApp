//
//  TicketCountdownElement.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct TicketCountdownElement: View {
    @Bindable var ticket: Ticket
    
    //Countdown
    @State private var remainingTime: String = ""
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private func updateRemainingTime() {
        let now = Date()
        let targetDate = ticket.organizationEvent.startTime
        let components = Calendar.current.dateComponents(
            [.day, .hour, .minute, .second],
            from: now,
            to: targetDate
        )
        
        if let days = components.day, let hours = components.hour, let minutes = components.minute, let seconds = components.second {
            remainingTime = String(format: "%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
        } else {
            remainingTime = "00:00:00:00" // Countdown finished or invalid
        }
    }

    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            AsyncImage(url: URL(string: ticket.organizationEvent.imageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray.frame(width: .infinity, height: 250)
            }.frame(maxWidth: .infinity, maxHeight: 250, alignment: .topLeading)
                .clipped()
                .cornerRadius(15)
            
            TicketCountdown(ticket: ticket, remaningTime: $remainingTime)
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
        }.onAppear {
            updateRemainingTime()
        }.onReceive(timer) { _ in
            updateRemainingTime()
        }
    }
}

#Preview {
    let model = MockModel()
    return TicketCountdownElement(ticket: model.getExampleTicket())
}
