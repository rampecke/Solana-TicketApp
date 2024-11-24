//
//  Collection.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

@Observable
class CollectionNFT: Identifiable {
    var uuid: UUID = UUID()
    var title: String
    var eventId: UUID
    var possibleCollectables: [Collectable]
    
    init(uuid: UUID, title: String, eventId: UUID, possibleCollectables: [Collectable]) {
        self.uuid = uuid
        self.title = title
        self.eventId = eventId
        self.possibleCollectables = possibleCollectables
    }
}

// Extension in CollectionNFT.swift
extension CollectionNFT {
    static func convertFromDtos(collectionDtos: [CollectionDto], myAddress: String) -> [CollectionNFT] {
        return collectionDtos.compactMap { dto in
            return CollectionNFT(
                uuid: UUID(uuidString: dto.id)!,
                title: dto.name,
                eventId: UUID(uuidString: dto.eventId)!,
                possibleCollectables: Collectable.convertFromDtos(collectableDtos: dto.collectables, myAddress: myAddress)
            )
        }
    }
}
