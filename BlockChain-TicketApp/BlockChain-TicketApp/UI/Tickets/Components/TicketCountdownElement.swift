//
//  TicketCountdownElement.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI

struct TicketCountdownElement: View {
    @Bindable var ticket: Ticket
    
    // Countdown state
    @State private var remainingTime: String = ""
    @State private var eventHasStarted: Bool = false // State to track if the event has started
    @State private var opacity: Double = 1.0 // State to control the opacity of the card
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    // Function to update remaining time and check if the event has started
    private func updateRemainingTime() {
        let now = Date()
        let targetDate = ticket.organizationEvent.startTime
        
        // If the event has already started, update opacity and set the event status
        if now >= targetDate {
            eventHasStarted = true
            remainingTime = "Event Ended" // Show this if the event is over
            opacity = 0.5 // Reduce opacity for past events
        } else {
            // Calculate the time remaining if the event hasn't started yet
            let components = Calendar.current.dateComponents(
                [.day, .hour, .minute, .second],
                from: now,
                to: targetDate
            )
            
            if let days = components.day, let hours = components.hour, let minutes = components.minute, let seconds = components.second {
                remainingTime = String(format: "%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
                opacity = 1.0 // Full opacity if event is in the future
            }
        }
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            // Background image with adjusted opacity
            Image("ExamplePicture") // TODO: Replace with actual image name
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 250, alignment: .topLeading)
                .clipped()
                .cornerRadius(15)
                .opacity(opacity) // Apply opacity based on event status
            
            // TicketCountdown component will show the countdown or "Event Ended"
            TicketCountdown(ticket: ticket, remaningTime: $remainingTime)
                .padding(.bottom, 10)
                .padding(.horizontal, 20)
        }
        .onAppear {
            updateRemainingTime() // Update remaining time when the view appears
        }
        .onReceive(timer) { _ in
            updateRemainingTime() // Update time every second
        }
    }
}

#Preview {
    let model = MockModel()
    return TicketCountdownElement(ticket: model.getExampleTicket())
}
