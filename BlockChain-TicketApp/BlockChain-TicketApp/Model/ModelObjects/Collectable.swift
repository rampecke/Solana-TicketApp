//
//  Collectable.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

@Observable
class Collectable {
    var uuid: UUID = UUID()
    var titel: String
    var collection: Collection
    var imageUrl: String
    var price: Double
    var numberInCollection: Int?
    var totalNumberInCollection: Int?
    
    init(titel: String, collection: Collection, imageUrl: String, price: Double, numberInCollection: Int?, totalNumberInCollection: Int?) {
        self.titel = titel
        self.collection = collection
        self.imageUrl = imageUrl
        self.price = price
        self.numberInCollection = numberInCollection
        self.totalNumberInCollection = totalNumberInCollection
    }
}
