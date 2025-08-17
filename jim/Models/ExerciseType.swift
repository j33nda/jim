//
//  ExerciseType.swift
//  jim
//
//  Created by jenda on 15.06.2025.
//

import Foundation
import SwiftData


@Model
class ExerciseType: Identifiable {
    var id = UUID()
    var name: String
    var unit: String
    
    init(name: String, unit: String = "kg") {
        self.name = name
        self.unit = unit
    }
}
