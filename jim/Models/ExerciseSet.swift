//
//  ExerciseSet.swift
//  jim
//
//  Created by jenda on 27.07.2025.
//

import Foundation
import SwiftData


@Model
class ExerciseSet: Identifiable {
    var id = UUID()
    var reps: Int = 0
    var load: Int = 0
    
    init(reps: Int, load: Int) {
        self.reps = reps
        self.load = load
    }
    
}
