//
//  ApiDto.swift
//  BlockChain-TicketApp
//
//  Created by Simon Osterlehner on 24.11.24.
//

public struct EventDto: Decodable {
    public var id: String
    public var eventName: String
    public var eventDescription: String
    public var startTime: String
    public var endTime: String
    public var imageUrl: String
    public var organizerName: String
    public var nameLocation: String
    public var locationLatitude: Float
    public var locationLongitude: Float
    public var eventCategory: EventCategoryType

    private enum CodingKeys: String, CodingKey {
        case id
        case eventName = "eventName"
        case eventDescription = "eventDescription"
        case startTime = "startTime"
        case endTime = "endTime"
        case imageUrl = "imageUrl"
        case organizerName = "organizerName"
        case nameLocation = "nameLocation"
        case locationLatitude = "locationLatitude"
        case locationLongitude = "locationLongitude"
        case eventCategory = "eventCategory"
    }

    // Custom decoding if `EventCategoryType` is not directly Decodable
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        eventName = try container.decode(String.self, forKey: .eventName)
        eventDescription = try container.decode(String.self, forKey: .eventDescription)
        startTime = try container.decode(String.self, forKey: .startTime)
        endTime = try container.decode(String.self, forKey: .endTime)
        imageUrl = try container.decode(String.self, forKey: .imageUrl)
        organizerName = try container.decode(String.self, forKey: .organizerName)
        nameLocation = try container.decode(String.self, forKey: .nameLocation)
        locationLatitude = try container.decode(Float.self, forKey: .locationLatitude)
        locationLongitude = try container.decode(Float.self, forKey: .locationLongitude)
        eventCategory = try container.decode(EventCategoryType.self, forKey: .eventCategory)
    }
}

public struct TicketDto: Decodable {
    public var id: String
    public var eventId: String
    public var buyerWalletAddress: String?
    public var claimedWalletAddress: String?
    public var seatingBlock: String
    public var seatingRow: String
    public var seatingSeat: String
    public var priceCategory: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case eventId = "eventId"
        case buyerWalletAddress = "buyerWalletAddress"
        case claimedWalletAddress = "claimedWalletAddress"
        case seatingBlock = "seatingBlock"
        case seatingRow = "seatingRow"
        case seatingSeat = "seatingSeat"
        case priceCategory = "priceCategory"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        eventId = try container.decode(String.self, forKey: .eventId)
        buyerWalletAddress = try container.decodeIfPresent(String.self, forKey: .buyerWalletAddress)
        claimedWalletAddress = try container.decodeIfPresent(String.self, forKey: .claimedWalletAddress)
        seatingBlock = try container.decode(String.self, forKey: .seatingBlock)
        seatingRow = try container.decode(String.self, forKey: .seatingRow)
        seatingSeat = try container.decode(String.self, forKey: .seatingSeat)
        priceCategory = try container.decode(Int.self, forKey: .priceCategory)
    }
}
