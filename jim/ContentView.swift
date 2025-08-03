//
//  ContentView.swift
//  jim
//
//  Created by jenda on 12.06.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            Tab("Sessions", systemImage: "figure.play") {
                SessionTabView()
            }
            
            Tab("Exercises", systemImage: "dumbbell") {
                ExercisesTab()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
