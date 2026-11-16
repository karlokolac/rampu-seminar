//
//  EditNoteView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftUI
import SwiftData

struct EditNoteView : View {
    @Environment(\.modelContext) private var modelContext
    
    @Bindable var note: Note
    
    @Query(sort: \Directory.name) private var directories: [Directory]
    
    @State private var tagName = ""
    
    private var sortedTags: [Tag] { note.tags.sorted { $0.name < $1.name } }

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
            
            Section("Tags") {
                ForEach(sortedTags) { tag in
                    Text("#\(tag.name)")
                }
                .onDelete { offsets in
                    let removed = offsets.map { sortedTags[$0] }
                    note.tags.removeAll { removed.contains($0) }
                }
                TextField("Add tag", text: $tagName)
                    .onSubmit(addTag)
            }

        }
        .navigationTitle(note.title.isEmpty ? "Untitled" : note.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func addTag() {
        // Uzmi tag, makni razmake sa pocetka i kraja i stavi u lowercase
        let name = tagName.trimmingCharacters(in: .whitespaces).lowercased()
        if (name.isEmpty) { return }
        
        // Ovo je efektivno SQL query
        // SELECT <Tag> WHERE name = 'name'
        let descriptor = FetchDescriptor<Tag>(predicate: #Predicate { $0.name == name })
        let tag: Tag
        
        // Ako rezultat fetch funkcije nije nil, onda tag = exists, inace napravi novi tag
        // i spremi ga u bazu
        if let exists = try? modelContext.fetch(descriptor).first {
            tag = exists
        } else {
            tag = Tag(name: name)
            modelContext.insert(tag)
        }

        if !note.tags.contains(tag) {
            note.tags.append(tag)
        }
        
        tagName = ""
    }
}
