//
//  AppContext.swift
//  jim
//
//  Created by jenda on 17.08.2025.
//

import Foundation
import SwiftData


@MainActor
struct AppModelContainer {
    
    var container: ModelContainer
    
    init() throws {
        let config = ModelConfiguration()
        container = try ModelContainer(for: Session.self, configurations: config)
        
        for e in exsTypes {
            container.mainContext.insert(e)
        }
    }
}
