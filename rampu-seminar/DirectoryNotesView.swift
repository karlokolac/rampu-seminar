//
//  DirectoryNotesView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftUI
import SwiftData

struct DirectoryNotesView : View {
    @Query private var notes: [Note]
    
    let directoryName: String
    
    init(directoryName: String) {
        self.directoryName = directoryName
        _notes = Query(
            filter: #Predicate<Note> { $0.directory?.name == directoryName },
            sort: \Note.createdAt
        )
    }
    
    var body: some View {
        List(notes) { note in
            NavigationLink(note.title) {
                EditNoteView(note: note)
            }
        }.navigationTitle(directoryName)
    }
}

