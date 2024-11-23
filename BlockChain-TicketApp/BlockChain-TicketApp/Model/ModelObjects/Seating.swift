//
//  Seating.swift
//  BlockChain-TicketApp
//
//  Created by Ramona Eckert on 23.11.24.
//

import Foundation

@Observable
class Seating {
    var block: String?
    var row: String?
    var seat: String?
    
    var extraSeatingInfo: String?
    
    init(block: String? = nil, row: String? = nil, seat: String? = nil, extraSeatingInfo: String? = nil) {
        self.block = block
        self.row = row
        self.seat = seat
        self.extraSeatingInfo = extraSeatingInfo
    }
    
    func allEmpty() -> Bool {
        return block == nil && row == nil && seat == nil
    }
}
