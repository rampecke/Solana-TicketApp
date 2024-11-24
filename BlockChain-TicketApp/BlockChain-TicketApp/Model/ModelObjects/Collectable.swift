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
    var title: String
    var collection: CollectionNFT?
    var imageUrl: String
    var price: Double
    var numberInCollection: Int?
    var totalNumberInCollection: Int?
    var ownedByMe: Bool
    
    init(uuid: UUID, title: String, collection: CollectionNFT?, imageUrl: String, price: Double, numberInCollection: Int?, totalNumberInCollection: Int?, ownedByMe: Bool) {
        self.uuid = uuid
        self.title = title
        self.collection = collection
        self.imageUrl = imageUrl
        self.price = price
        self.numberInCollection = numberInCollection
        self.totalNumberInCollection = totalNumberInCollection
        self.ownedByMe = ownedByMe
    }
}

// Extension in OrganizationEvent.swift
extension Collectable {
    static func convertFromDtos(collectableDtos: [CollectableDto]) -> [Collectable] {
        return collectableDtos.compactMap { dto in
            return Collectable(
                uuid: UUID(uuidString: dto.id)!,
                title: dto.name,
                collection: nil,
                imageUrl: dto.imageUrl,
                price: 0,
                numberInCollection: nil,
                totalNumberInCollection: nil,
                ownedByMe: true
            )
        }
    }
}
