//
//  NotesMigrationPlan.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftData

enum NotesMigrationPlan: SchemaMigrationPlan {
    static var schemas: [any VersionedSchema.Type] {
        [SchemaV1.self, SchemaV2.self]
    }

    static var stages: [MigrationStage] {
        [.lightweight(fromVersion: SchemaV1.self, toVersion: SchemaV2.self)]
    }
}
