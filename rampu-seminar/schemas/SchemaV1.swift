//
//  SchemaV1.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import Foundation
import SwiftData

enum SchemaV1: VersionedSchema {
    static let versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] {
        [Note.self, Directory.self, Tag.self, ChecklistItem.self]
    }

    @Model
    final class Note {
        var title: String
        var content: String
        var createdAt: Date
        var directory: Directory?

        @Relationship(inverse: \Tag.notes)
        var tags: [Tag] = []

        @Relationship(deleteRule: .cascade, inverse: \ChecklistItem.note)
        var checklistItems: [ChecklistItem] = []

        init(title: String, content: String) {
            self.title = title
            self.content = content
            self.createdAt = .now
        }
    }

    @Model
    final class Directory {
        var name: String

        @Relationship(inverse: \Note.directory)
        var notes: [Note] = []

        init(name: String) {
            self.name = name
        }
    }

    @Model
    final class Tag {
        @Attribute(.unique)
        var name: String
        var notes: [Note] = []

        init(name: String) {
            self.name = name
        }
    }

    @Model
    final class ChecklistItem {
        var position: Int
        var text: String
        var isDone: Bool = false
        var note: Note?

        init(position: Int, text: String) {
            self.position = position
            self.text = text
        }
    }
}
