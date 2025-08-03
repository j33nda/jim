//
//  Exercise.swift
//  jim
//
//  Created by jenda on 14.06.2025.
//

import Foundation
import SwiftData


@Model
class Exercise: Identifiable {
    var id = UUID()
    var sets: [ExerciseSet] = []
    var type: ExerciseType
    
    init(type: ExerciseType) {
        self.type = type
    }
    
}
