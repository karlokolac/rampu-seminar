//
//  Note.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftData
import Foundation

@Model
final class Note {
    var title: String
    var content: String
    var createdAt: Date
    var directory: Directory?
    
    @Relationship(inverse: \Tag.note)
    var tags: [Tag] = []
    
    @Relationship(deleteRule: .cascade, inverse: \ChecklistItem.note)
    var checklistItems: [ChecklistItem] = []
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
        self.createdAt = .now
    }
}
