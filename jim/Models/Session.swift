//
//  Session.swift
//  jim
//
//  Created by jenda on 14.06.2025.
//

import Foundation
import SwiftData


@Model
class Session: Identifiable {
    var id = UUID()
    var date = Date.now
    var duration = 0
    var exercises: [Exercise] = []
    
    init(exercises: [Exercise] = []) {
        self.date = Date.now
        self.exercises = exercises
    }
    
}
