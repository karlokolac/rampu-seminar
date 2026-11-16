//
//  SettingsView.swift
//  rampu-seminar
//
//  Created by Karlo Kolac on 16.11.2026..
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("username") private var username = ""
    @AppStorage("darkMode") private var darkMode = false

    var body: some View {
        NavigationStack {
            Form {
                TextField("Username", text: $username)
                Toggle("Dark mode", isOn: $darkMode)
            }
            .navigationTitle("Settings")
        }
    }
}
