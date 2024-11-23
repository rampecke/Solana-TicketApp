//
//  Collectable.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

class Collectable {
    var titel: String
    var collection: Collection
    var imageUrl: String
    var price: Int
    
    init(titel: String, collection: Collection, imageUrl: String, price: Int) {
        self.titel = titel
        self.collection = collection
        self.imageUrl = imageUrl
        self.price = price
    }
}
