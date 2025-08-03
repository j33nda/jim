//
//  DataProvider.swift
//  jim
//
//  Created by jenda on 10.07.2025.
//

import Foundation
import SwiftData


@MainActor
struct PreviewData {
    
    let container: ModelContainer
    var exerciseTypes: [ExerciseType] = []
    var exercises: [[Exercise]] = []
    var sessions: [Session] = []
    
    
    init() throws {
        
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: Session.self, configurations: config)
        
        
        let exs_names = ["Lat Pull Down", "Preacher Biceps Curl", "Leg Extensions", "Hexbar Squats", "Shoulder Press", "Standing Calf Raises", "Chest Press", "Rumunian Deadlift"]
        for e in exs_names {
            let exerciseType = ExerciseType(name: e)
            exerciseTypes.append(exerciseType)
            container.mainContext.insert(exerciseType)
        }
        
        
        let dates = [Date(timeIntervalSince1970: 1753635831), Date(timeIntervalSince1970: 1753135831)]
        exercises = [
            [
                Exercise(type: exerciseTypes[7]),
                Exercise(type: exerciseTypes[6]),
                Exercise(type: exerciseTypes[0]),
                Exercise(type: exerciseTypes[5])
            ],
            [
                Exercise(type: exerciseTypes[4]),
                Exercise(type: exerciseTypes[1]),
                Exercise(type: exerciseTypes[2]),
                Exercise(type: exerciseTypes[3])
            ]
        ]

        
        
        for i in 0..<2 {
            let session = Session()
            session.date = dates[i]
            session.exercises = exercises[i]
            sessions.append(session)
            container.mainContext.insert(session)
        }
        
        
    }
}
