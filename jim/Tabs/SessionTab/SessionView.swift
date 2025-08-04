//
//  SessionView.swift
//  jim
//
//  Created by jenda on 10.07.2025.
//

import SwiftUI
import SwiftData

struct SessionView: View {
    
    @Query var exerciseTypes: [ExerciseType]
    
    @State var newExerciseSheet: Bool = false
    
    var session: Session

    
    var body: some View {
        VStack {
            
            ScrollView {
                
                addExerciseButton
                    .onTapGesture {
                        newExerciseSheet.toggle()
                    }
                
                ForEach(session.exercises) { exercise in
                    
                    SessionExerciseView(exercise: exercise)
                }
            }
            
        }
        .padding()
        .navigationTitle("Thu, 17. 3.")
        .navigationBarTitleDisplayMode(.large)
        .sheet(isPresented: $newExerciseSheet) {
            List(exerciseTypes) { excType in
                Text(excType.name)
                    .onTapGesture {
                        let newExercise = Exercise(type: excType)
                        session.exercises.append(newExercise)
                        newExerciseSheet = false
                    }
            }
        }
        
    }
    
    
    var addExerciseButton: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10.0)
                .fill(
                    MeshGradient(width: 2, height: 2, points: [
                        .init(0, 0), .init(1, 0),
                        .init(0, 1), .init(1, 1)
                    ], colors: [
                        .mint, .blueBackground,
                        .blueBackground, .mint
                    ], smoothsColors: true)
                )
            
            Text("Add Exercise")
                .foregroundStyle(Color.black)
                .bold()
                .font(.headline)

        }
        .frame(height: 50)
        .padding()
    }
}

#Preview {
    
    do {
        let p = try PreviewData()
        
        return NavigationStack {
            SessionView(session: p.sessions[0])
        }
        .modelContainer(p.container)
        
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
    
}


