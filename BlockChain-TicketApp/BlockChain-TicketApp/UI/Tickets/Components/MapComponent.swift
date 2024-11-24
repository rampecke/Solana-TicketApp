//
//  MapComponent.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import SwiftUI
import MapKit

struct MapComponent: View {
    @Bindable var organizationEvent: OrganizationEvent
    
    // Address Variables
    @State private var address: String = "Loading address..."
    
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
        Group {
            HStack {
                Image(systemName: "pin.fill")
                    .font(.subheadline) //
                    .foregroundColor(Color("accentColor"))

                Text(address)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }.padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .onAppear {
                fetchAddress(from: organizationEvent.location)
            }
            
            //Map
            Map() { //TODO: Maybe zoom out a bit more
                Marker("Location", coordinate: organizationEvent.location)
            }.mapStyle(.standard)
            .frame(height: 300)
            .cornerRadius(15)
            .padding(.horizontal)
        }
    }
}

#Preview {
    MapComponent(organizationEvent: PreviewModel().getExampleTicket().organizationEvent)
}
