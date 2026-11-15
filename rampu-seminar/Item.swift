//
//  Item.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 15.11.2026..
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
