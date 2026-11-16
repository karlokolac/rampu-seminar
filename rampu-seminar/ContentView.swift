//
//  ContentView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 15.11.2026..
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Note.createdAt, order: .reverse) private var notes: [Note]
    
    @State private var isAdding = false

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        EditNoteView(note: note)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(note.title.isEmpty ? "Untitled" : note.title).font(.headline)
                            Text(note.createdAt, format: .dateTime.day().month().hour().minute())
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }.onDelete(perform: deleteNotes)
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { EditButton() }
                ToolbarItem {
                    Button { isAdding = true } label: {
                        Label("Add Note", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink {
                        DirectoryView()
                    } label: {
                        Label("Directories", systemImage: "folder")
                    }
                }
            }
        } detail: {
            Text("Select a note")
        }.sheet(isPresented: $isAdding) { NewNoteView() }
    }

    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(notes[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Note.self, inMemory: true)
}
