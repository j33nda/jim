//
//  ExercisesTab.swift
//  jim
//
//  Created by jenda on 28.07.2025.
//

import SwiftUI
import SwiftData

struct ExercisesTab: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(sort: \ExerciseType.name, order: .forward) private var exercises: [ExerciseType]
    
    @State var addNewExerciseSheet: Bool = false
    @State var name = ""
    
    
    var body: some View {
        
        NavigationStack {
            
            List {
                
                ForEach(exercises) { exercise in
                    
                    Text(exercise.name)
                }
            }
            .navigationTitle("Exercises")
            .toolbar {
                toolbar
            }
            .sheet(isPresented: $addNewExerciseSheet) {
                addNewExerciseSheetView
            }
        }
    }
    
    
    var toolbar: some ToolbarContent {
        
        ToolbarItem(placement: .topBarTrailing) {
            
            Button {
                addNewExerciseSheet.toggle()
            } label: {
                Image(systemName: "plus")
            }
        }
    }
    
    
    var addNewExerciseSheetView: some View {
        
        NavigationStack{
            
            Form {
                
                TextField("Name", text: $name)
            }
            .toolbar {
                Button {
                    context.insert(ExerciseType(name: name))
                    name = ""
                    addNewExerciseSheet = false
                    print("added new exercise")
                } label: {
                    Text("Add")
                }
                .disabled(name.isEmpty)
            }
        }
    }
}


#Preview {
    
    
    do {
        let p = try PreviewData()
        
        return ExercisesTab()
            .modelContainer(p.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
