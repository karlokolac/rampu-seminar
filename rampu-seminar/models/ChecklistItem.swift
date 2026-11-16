//
//  ChecklistItem.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftData

@Model
final class ChecklistItem {
    var position: Int
    var text: String
    var isDone: Bool = false
    var note: Note?
    
    init(position: Int, text: String) {
        self.position = position
        self.text = text
        self.isDone = false
    }
}

