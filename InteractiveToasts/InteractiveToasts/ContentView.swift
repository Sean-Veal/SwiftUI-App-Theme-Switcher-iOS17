//
//  ContentView.swift
//  InteractiveToasts
//
//  Created by Sean Veal on 1/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var toasts: [Toast] = []
    var body: some View {
        NavigationStack {
            List {
                Text("Dummy List Row View")
            }
            .navigationTitle("Toasts")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Show") {
                        showToast()
                    }
                }
            }
        }
        .interactiveToasts($toasts)
    }
    
    func showToast() {
        withAnimation(.bouncy) {
            let toast = Toast { id in
                ToastView(id)
            }
            toasts.append(toast)
        }
    }
    
    // Custom Toast View
    @ViewBuilder
    func ToastView(_ id: String) -> some View {
        HStack(spacing: 12) {
            Image(systemName: "airpods.pro")
            
            Text("iJustine's Airpods")
                .font(.callout)
            
//            Spacer(minLength: 0)
//            
//            Button {
//                $toasts.delete(id)
//            } label: {
//                Image(systemName: "xmark.circle.fill")
//                    .font(.title2)
//            }

        }
        .foregroundStyle(.primary)
        .padding(.vertical, 12)
        .padding(.horizontal, 15)
        .padding(.trailing, 10)
        .background {
            Capsule()
                .fill(.background)
            // Shadows
                .shadow(color: .black.opacity(0.06), radius: 3, x: -1, y: -3)
                .shadow(color: .black.opacity(0.06), radius: 2, x: 1, y: 3)
        }
//        .padding(.horizontal, 15)
    }
}

#Preview {
    ContentView()
}
