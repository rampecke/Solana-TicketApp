//
//  LoadMetadata.swift
//  BlockChain-TicketApp
//
//  Created by Simon Osterlehner on 23.11.24.
//

import Foundation

struct MyObject: Decodable {
    let id: Int
    let name: String
    let isActive: Bool
}

class JSONDownloader {
    // Async function to fetch and decode JSON
    static func fetchJSON<T: Decodable>(from url: String) async throws -> T {
        // Ensure the URL is valid
        guard let url = URL(string: url) else {
            throw NSError(domain: "InvalidURL", code: 1, userInfo: nil)
        }
        
        // Fetch data from the URL
        let (data, _) = try await URLSession.shared.data(from: url)
        
        // Decode the JSON into the specified object
        let decodedObject = try JSONDecoder().decode(T.self, from: data)
        return decodedObject
    }
}
