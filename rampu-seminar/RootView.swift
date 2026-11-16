//
//  RootView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftUI
import SwiftData

struct RootView : View {
    var body: some View {
        TabView {
            Tab("Database", systemImage: "externaldrive") { ContentView() }
            Tab("Files", systemImage: "folder") { FilesView() }
            Tab("Settings", systemImage: "gearshape") { SettingsView() }
        }
    }
}

#Preview {
    RootView().modelContainer(for: Note.self, inMemory: true)
}
