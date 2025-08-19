//
//  SessionExerciseView.swift
//  jim
//
//  Created by jenda on 30.07.2025.
//


import SwiftUI

struct SessionExerciseView: View {
    var exercise: Exercise
    
    @State private var add: Bool = false
    
    @State private var newReps: Int = 0
    @State private var newLoad: Int = 0

    
    var body: some View {
        
        VStack {
            
            HStack {
                
                label

                Spacer()
                
                Button {
                    
                    withAnimation(){
                        add.toggle()
                    }
                    
                } label: {
                    
                    if !add {
                        Image(systemName: "plus")
                    } else {
                        Image(systemName: "chevron.up")
                    }
                }
            }
            .padding()
            
            ForEach(exercise.sets, id: \.self) { set in
                
                Text("\(set.reps) x \(set.load)")
            }
        
            if add {
                addRepsView
            }
        }
        .background(alignment: .center) {
            
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color.gray.opacity(0.05))
        }
        .padding()
    }
    
    
    
    var addRepsView: some View {
        
        VStack {
            
            HStack {
                Spacer()

                Picker("Reps", selection: $newReps) {
                    
                    ForEach(0..<100) { i in
                        Text("\(i)")
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 75, height: 75)
                
                Text("x")
                
                Picker("Load", selection: $newLoad) {
                    
                    ForEach(0..<500) { i in
                        Text("\(i)")
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 75, height: 75)
                
                Text(exercise.type.unit)
            }
            
            
            Button {
                withAnimation {
                    exercise.sets.append(ExerciseSet(reps: newReps, load: newLoad))
                }
            } label: {
                
                Text("Add")
            }
            .buttonStyle(.bordered)
            
        }
        .padding()
    }
    
    var label: some View {
        Label {
            Text(exercise.type.name)
                .bold()
        } icon: {
            if exercise.sets.count > 0 {
                Text("\(exercise.sets.count) x")
            }

        }
    }
}


#Preview {
    
    do {
        let p = try PreviewData()
        
        return NavigationStack{
            SessionExerciseView(exercise: Exercise(type: p.exerciseTypes[0]))
            
            Spacer()

        }
        .modelContainer(p.container)
        
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
    
    
}
