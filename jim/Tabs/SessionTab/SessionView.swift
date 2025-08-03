//
//  SessionView.swift
//  jim
//
//  Created by jenda on 10.07.2025.
//

import SwiftUI

struct SessionView: View {
    
    var session: Session
    
    
    var body: some View {
        VStack {
            
            ScrollView {
                
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
                
                ForEach(session.exercises) { exercise in
                    
                    SessionExerciseView(exercise: exercise)
                }
            }
            
        }
        .padding()
        .navigationTitle("Thu, 17. 3.")
        .navigationBarTitleDisplayMode(.large)
        
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


