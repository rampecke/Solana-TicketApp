//
//  TicketView.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct TicketView: View {
    @Bindable var ticket: Ticket
    
    func generateQRCode(from string: String) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        // Input the string into the QR code generator
        filter.message = Data(string.utf8)
        
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Event Title
            Text(ticket.ticketName)
                .font(.headline)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            
            // Place and Date
            VStack(alignment: .center, spacing: 4) {
                Text("\(formatDateRange(date: ticket.startTime))")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(ticket.nameLocation)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity) // Center horizontally
            
            // Dotted Line
            Divider()
                .overlay(Color.gray)
                .padding(.horizontal)
                .frame(height: 1)
            
            // QR Code Placeholder
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 170, height: 170)
                .cornerRadius(8)
                .overlay(
                    Image(uiImage: generateQRCode(from: "\(ticket.id)\n\(ticket.endTime)"))
                        .interpolation(.none)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding()
                )
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            
            // Dotted Line
            Divider()
                .overlay(Color.gray)
                .padding(.horizontal)
                .frame(height: 1)
                
            
            // Ticket Type
            Text(ticket.ticketType)
                .font(.headline)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .center)
            
            // Seating Information
            if !ticket.seating.allEmpty() {
                HStack(spacing: 16) {
                    if let block = ticket.seating.block {
                        SeatingElement(heading: "Block", seatingValue: block)
                    }
                    if let row = ticket.seating.row {
                        SeatingElement(heading: "Row", seatingValue: row)
                    }
                    if let seat = ticket.seating.seat {
                        SeatingElement(heading: "Seat", seatingValue: seat)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
            }
            
            // Extra Seating Info
            if let extraInfo = ticket.seating.extraSeatingInfo {
                Text(extraInfo)
                    .font(.subheadline)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
    
    // Helper function to format the date range
    private func formatDateRange(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E - MMM d - hh:mma"
        let dateString = formatter.string(from: date)
        return dateString
    }
}


#Preview {
    let mockModel = MockModel()
    return TicketView(ticket: mockModel.getExampleTicket())
}
