//
//  Tag.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftData

@Model
final class Tag {
    var name: String
    var note: Note?
    
    init(name: String) {
        self.name = name
    }
}
