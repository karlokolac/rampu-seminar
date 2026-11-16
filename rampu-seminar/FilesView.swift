//
//  FilesView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftUI

struct FilesView: View {
    @State private var text = ""
    @State private var files: [URL] = []
    @State private var message = ""

    private let fileURL = URL.documentsDirectory.appending(path: "note.txt")

    var body: some View {
        NavigationStack {
            Form {
                Section("note.txt") {
                    TextField("Write something", text: $text, axis: .vertical)
                        .lineLimit(5...)
                    Button("Save", action: save)
                    Button("Load", action: load)
                    Button("Delete", role: .destructive, action: delete)
                }

                Section("Documents folder") {
                    ForEach(files, id: \.self) { file in
                        Text(file.lastPathComponent)
                    }
                }

                if !message.isEmpty {
                    Text(message).foregroundStyle(.secondary)
                }
            }
            .navigationTitle("Files")
            .onAppear(perform: refreshFiles)
        }
    }

    private func save() {
        do {
            try text.write(to: fileURL, atomically: true, encoding: .utf8)
            message = "Saved"
        } catch {
            message = error.localizedDescription
        }
        refreshFiles()
    }

    private func load() {
        do {
            text = try String(contentsOf: fileURL, encoding: .utf8)
            message = "Loaded"
        } catch {
            message = error.localizedDescription
        }
    }

    private func delete() {
        do {
            try FileManager.default.removeItem(at: fileURL)
            text = ""
            message = "Deleted"
        } catch {
            message = error.localizedDescription
        }
        refreshFiles()
    }

    private func refreshFiles() {
        files = (try? FileManager.default.contentsOfDirectory(
            at: .documentsDirectory,
            includingPropertiesForKeys: nil
        )) ?? []
    }
}
