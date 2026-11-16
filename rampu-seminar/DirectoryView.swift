//
//  DirectoryView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftUI
import SwiftData

struct DirectoryView : View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \Directory.name) private var directories: [Directory]
    
    @State private var directoryName = ""
    
    var body: some View {
        List {
            Section {
                TextField("New directory", text: $directoryName).onSubmit(addDirectory)
            }
            
            Section {
                ForEach(directories) { directory in
                    LabeledContent(directory.name, value: "\(directory.notes.count)")
                }.onDelete(perform: deleteDirectories)
            }
        }
        .navigationTitle("Directories")
    }
    
    private func addDirectory() {
        if(directoryName.isEmpty) { return }
        modelContext.insert(Directory(name: directoryName))
        directoryName = ""
    }
    
    private func deleteDirectories(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(directories[index])
            }
        }
    }
}
