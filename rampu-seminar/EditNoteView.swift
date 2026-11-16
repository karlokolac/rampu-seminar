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
    
    @Query(sort: \Directory.name) private var directories: [Directory]
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $note.title)
                TextField("Content", text: $note.content, axis: .vertical).lineLimit(5...)
            }
            
            Section("Note directory") {
                Picker("Directory", selection: $note.directory) {
                    Text("None").tag(nil as Directory?)
                    ForEach(directories) { directory in
                        Text(directory.name).tag(directory as Directory?)
                    }
                }
            }
        }
        .navigationTitle(note.title.isEmpty ? "Untitled" : note.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}
