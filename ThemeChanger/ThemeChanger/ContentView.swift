//
//  ContentView.swift
//  ThemeChanger
//
//  Created by Sean Veal on 1/30/24.
//

import SwiftUI

struct ContentView: View {
    /// View Properties
    @State private var changeTheme: Bool = false
    @Environment(\.colorScheme) private var scheme
    @AppStorage("userTheme") private var userTheme: Theme = .systemDefault
    
    var body: some View {
        NavigationStack {
            List {
                Section("Appearance") {
                    Button("Change Theme") {
                        changeTheme.toggle()
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .preferredColorScheme(userTheme.colorScheme)
        .sheet(isPresented: $changeTheme, content: {
            ThemeChangeView(scheme: scheme)
            /// Since Max Height is 410
                .presentationDetents([.height(410)])
                .presentationBackground {
                    Color.clear
                }
        })
    }
}

#Preview {
    ContentView()
}
