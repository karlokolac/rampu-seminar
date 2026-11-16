//
//  Tag.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftData

extension SchemaV2 {
    @Model
    final class Tag {
        @Attribute(.unique)
        var name: String
        var notes: [Note] = []
        
        init(name: String) {
            self.name = name
        }
    }
}
