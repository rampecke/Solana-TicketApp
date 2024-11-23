//
//  Ticket.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation
import MapKit
import CoreLocation

@Observable
class Ticket {
    var id: UUID
    var ticketName: String
    var startTime: Date
    var endTime: Date
    var ticketType: String
    var seating: Seating
    var location: CLLocationCoordinate2D
    var placeName: String = ""
    var eventDescription: String
    var orderId: String
    
    private let geocoder = CLGeocoder()
    
    init(id: UUID, ticketName: String, startTime: Date, endTime: Date, ticketType: String, seating: Seating, location: CLLocationCoordinate2D, eventDescription: String, orderId: String) {
        self.id = id
        self.ticketName = ticketName
        self.startTime = startTime
        self.endTime = endTime
        self.ticketType = ticketType
        self.seating = seating
        self.location = location
        self.eventDescription = eventDescription
        self.orderId = orderId
        
        resolvePlaceName()
    }
    
    private func resolvePlaceName() {
        let location = CLLocation(latitude: self.location.latitude, longitude: self.location.longitude)
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            guard let self = self else { return }
            if let placemark = placemarks?.first {
                self.placeName = [
                    placemark.name,
                    placemark.locality,
                    placemark.administrativeArea,
                    placemark.country
                ].compactMap { $0 }.joined(separator: ", ")
            } else {
                self.placeName = "Unknown Place"
            }
        }
    }
}
