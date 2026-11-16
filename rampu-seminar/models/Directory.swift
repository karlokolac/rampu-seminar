//
//  Directory.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftData

extension SchemaV2 {
    @Model
    final class Directory {
        var name: String
        
        @Relationship(inverse: \Note.directory)
        var notes: [Note] = []
        
        init(name: String) {
            self.name = name
        }
    }
}
