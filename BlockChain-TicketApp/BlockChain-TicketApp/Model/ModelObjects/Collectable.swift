//
//  Collectable.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

@Observable
class Collectable: Identifiable {
    var uuid: UUID = UUID()
    var titel: String
    var collection: CollectionNFT
    var imageUrl: String
    var price: Double
    var numberInCollection: Int?
    var totalNumberInCollection: Int?
    var ownedByMe: Bool
    
    init(titel: String, collection: CollectionNFT, imageUrl: String, price: Double, numberInCollection: Int?, totalNumberInCollection: Int?, ownedByMe: Bool) {
        self.titel = titel
        self.collection = collection
        self.imageUrl = imageUrl
        self.price = price
        self.numberInCollection = numberInCollection
        self.totalNumberInCollection = totalNumberInCollection
        self.ownedByMe = ownedByMe
    }
}
