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

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(notes) { note in
                    NavigationLink {
                        Text(note.content)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(note.title).font(.headline)
                            Text(note.createdAt, format: .dateTime.day().month().hour().minute())
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }.onDelete(perform: deleteNotes)
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { EditButton() }
                ToolbarItem {
                    Button(action: addNote) {
                        Label("Add Note", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select a note")
        }
    }

    private func addNote() {
        withAnimation {
            modelContext.insert(Note(title: "New Note", content: "Note content"))
        }
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
        .modelContainer(for: Item.self, inMemory: true)
}
