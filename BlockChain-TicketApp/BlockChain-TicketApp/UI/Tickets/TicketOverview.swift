//
//  TicketOverview.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI
import MapKit

struct TicketOverview: View {
    @Bindable var ticket: Ticket
    
    //Expandable Text
    @State private var isExpanded: Bool = false
    
    // Address Variables
    @State private var address: String = "Loading address..."
    
    init(ticket: Ticket) {
        self.ticket = ticket
    }
    
    private func fetchAddress(from coordinate: CLLocationCoordinate2D) {
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
        
        geocoder.reverseGeocodeLocation(location) { placemarks, error in
            if let error = error {
                print("Failed to reverse geocode location: \(error)")
                address = "Unknown location"
                return
            }
            
            if let placemark = placemarks?.first {
                let street = placemark.thoroughfare ?? ""
                let city = placemark.locality ?? ""
                address = "\(street), \(city)"
            } else {
                address = "Unknown location"
            }
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing:10) {
                ZStack(alignment: .bottom) {
                    Image("ExamplePicture") // TODO: Replace with my image name
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 250, alignment: .topLeading)
                        .clipped()
                        .cornerRadius(15)
                    
                    TicketHeader(ticket: ticket)
                        .padding(.bottom, 10)
                        .padding(.horizontal, 20)
                }.padding(.horizontal)
                
                // Title below the ZStack
                Text("About this event")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                //Text(ticket.eventDescription)
                Text(ticket.organizationEvent.eventDescription.count > 200 && !isExpanded ? "\(String(ticket.organizationEvent.eventDescription.prefix(200)))..." : ticket.organizationEvent.eventDescription)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                if ticket.organizationEvent.eventDescription.count > 300 {
                    HStack(alignment: .top){
                        Button(action: {
                            isExpanded.toggle()
                        }) {
                            Text(isExpanded ? "Show Less" : "Show More")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                        }
                    }.padding(.horizontal)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                HStack {
                    Image(systemName: "pin.fill")
                        .font(.subheadline) //
                        .foregroundColor(.blue)

                    Text(address)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }.padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .onAppear {
                    fetchAddress(from: ticket.organizationEvent.location)
                }
                
                //Map
                Map() { //TODO: Maybe zoom out a bit more
                    Marker("Location", coordinate: ticket.organizationEvent.location)
                }.mapStyle(.standard)
                .frame(height: 300)
                .cornerRadius(15)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    let model = MockModel()
    return TicketOverview(ticket: model.getExampleTicket()).environment(model as Model)
}
