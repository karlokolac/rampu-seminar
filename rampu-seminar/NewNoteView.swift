//
//  NewNoteView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftUI
import SwiftData

struct NewNoteView : View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var content = ""
    @State private var directory: Directory?
    
    @Query(sort: \Directory.name) private var directories: [Directory]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Content", text: $content, axis: .vertical).lineLimit(5...10)
                }
                
                Section("Note directory") {
                    Picker("Directory", selection: $directory) {
                        Text("None").tag(nil as Directory?)
                        ForEach(directories) { directory in
                            Text(directory.name).tag(directory as Directory?)
                        }
                    }
                }
            }
            .navigationTitle("New note")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let note = Note(title: title, content: content)
                        modelContext.insert(note)
                        note.directory = directory
                        dismiss()
                    }.disabled(title.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
            }
        }
    }
}
