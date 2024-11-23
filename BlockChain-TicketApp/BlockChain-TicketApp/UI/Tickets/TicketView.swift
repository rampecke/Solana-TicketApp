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
    
    func generateQRCode(from string: String) -> Image {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        
        // Input the string into the QR code generator
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10)), from: outputImage.extent) {
                return Image(decorative: cgImage, scale: 1.0, orientation: .up)
            }
        }
        
        return Image(systemName: "xmark.circle") // Fallback in case QR code generation fails
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
                Text(ticket.placeName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(formatDateRange(start: ticket.startTime, end: ticket.endTime))
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .frame(maxWidth: .infinity) // Center horizontally
            
            // QR Code Placeholder
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 150, height: 150)
                .cornerRadius(8)
                .overlay(Text("QR Code").foregroundColor(.gray))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
            
            
//            generateQRCode(from: "Test bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteenTest bllahtehhzn nbazjlenbagg, zahennehjahahan, teheheteen")
//                .resizable()
//                .interpolation(.none)
//                .padding(.vertical, 16)
            
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
    private func formatDateRange(start: Date, end: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E - MMM d - hh:mma"
        let startString = formatter.string(from: start)
        let endString = formatter.string(from: end)
        return "\(startString) - \(endString)"
    }
}


#Preview {
    let mockModel = MockModel()
    return TicketView(ticket: mockModel.getExampleTicket())
}
