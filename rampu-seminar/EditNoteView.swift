//
//  EditNoteView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftUI
import SwiftData

struct EditNoteView : View {
    @Bindable var note: Note
    
    var body: some View {
        Form {
            TextField("Title", text: $note.title)
            TextField("Content", text: $note.content, axis: .vertical).lineLimit(5...)
        }
        .navigationTitle(note.title.isEmpty ? "Untitled" : note.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
