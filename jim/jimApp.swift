//
//  jimApp.swift
//  jim
//
//  Created by jenda on 12.06.2025.
//

import SwiftUI

@main
struct jimApp: App {
    var appModelContainer: AppModelContainer
    
    init() {
        
        do {
            appModelContainer = try AppModelContainer()
        } catch {
            fatalError("Failed to configure SwiftData container. \(error.localizedDescription)")
        }
        
        insertDefaultExercisesIfNeeded()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(appModelContainer.container)
        }
    }
    
    func insertDefaultExercisesIfNeeded() {
        let defaults = UserDefaults.standard
        let key = "defaultExercises"
        
        if !defaults.bool(forKey: key) {
            appModelContainer.insertDefaultExercises()
            defaults.set(true, forKey: key)
        }
    }
}
