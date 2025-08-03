//
//  jimApp.swift
//  jim
//
//  Created by jenda on 12.06.2025.
//

import SwiftUI

@main
struct jimApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Session.self)
        }
    }
}
