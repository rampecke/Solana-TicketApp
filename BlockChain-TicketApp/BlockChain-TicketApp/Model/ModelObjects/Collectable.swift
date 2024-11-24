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
    var nftAddress: String
    
    init(uuid: UUID, title: String, collection: CollectionNFT?, imageUrl: String, price: Double, numberInCollection: Int?, totalNumberInCollection: Int?, ownedByMe: Bool, nftAddress: String) {
        self.uuid = uuid
        self.title = title
        self.collection = collection
        self.imageUrl = imageUrl
        self.price = price
        self.numberInCollection = numberInCollection
        self.totalNumberInCollection = totalNumberInCollection
        self.ownedByMe = ownedByMe
        self.nftAddress = nftAddress
    }
}

// Extension in OrganizationEvent.swift
extension Collectable {
    static func convertFromDtos(collectableDtos: [CollectableDto], myAddress: String) -> [Collectable] {
        return collectableDtos.compactMap { dto in
            let maxNumber = Int.random(in: 1...10)
            let numberInCollection = Int.random(in: 1...maxNumber)
            
            return Collectable(
                uuid: UUID(uuidString: dto.id)!,
                title: dto.name,
                collection: nil,
                imageUrl: dto.imageUrl,
                price: Double.random(in: 0.5...4),
                numberInCollection: numberInCollection,
                totalNumberInCollection: maxNumber,
                ownedByMe: dto.claimedByAddress == myAddress,
                nftAddress: dto.nftAddress
            )
        }
    }
}
