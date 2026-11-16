//
//  SchemaV2.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftData

enum SchemaV2: VersionedSchema {
    static let versionIdentifier = Schema.Version(2, 0, 0)

    static var models: [any PersistentModel.Type] {
        [Note.self, Directory.self, Tag.self, ChecklistItem.self]
    }
}

typealias Note = SchemaV2.Note
typealias Directory = SchemaV2.Directory
typealias Tag = SchemaV2.Tag
typealias ChecklistItem = SchemaV2.ChecklistItem
