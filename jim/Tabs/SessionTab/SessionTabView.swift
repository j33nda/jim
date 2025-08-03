//
//  SessionTabView.swift
//  jim
//
//  Created by jenda on 14.06.2025.
//

import SwiftUI
import SwiftData

struct SessionTabView: View {
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Session.date, order: .reverse) private var sessions: [Session]
    
    
    var body: some View {
        
        let spacing = 10.0
        
        NavigationStack {
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    activityChart
                }
                .padding(.top)
                
                weightChart
                    .padding(.top)
                    .padding(.bottom)
                
                ScrollView{
                    
                    LazyVGrid(columns: [GridItem(spacing: spacing), GridItem(spacing: spacing)], spacing: spacing) {
                        
                        Button {
                            print("add session")
                            
                            context.insert(Session())
                            
                        } label: {
                            plusCard
                        }
                        .tint(.green)
                        
                        ForEach(sessions) { session in
                            
                            NavigationLink(value: session, label: {
                                SessionCardView(duration: session.duration, date: session.date)
                                    .contextMenu{
                                        Button {
                                            context.delete(session)
                                        } label: {
                                            Text("Delete")
                                        }
                                    }
                            })
                            .tint(.primary)
                        }
                    }
                }
            }
            .navigationDestination(for: Session.self, destination: { session in
                SessionView(session: session)
            })
            .padding()
        }
    }
    
    
    var activityChart: some View {
        
        ActivityChartView()
    }
    
    var weightChart: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.3))
                .frame(height: 100)
            
            Text("Weight Chart")
        }
    }
    
    
    var plusCard: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .fill(LinearGradient(colors: [.greenPlus, .white, .greenPlus, .white, .greenPlus], startPoint: .topLeading, endPoint: .bottomTrailing))
                .fill(.ultraThinMaterial)
                .aspectRatio(2, contentMode: .fit)
            
            Image(systemName: "plus")
                .font(.largeTitle)
        }
    }
}

#Preview {
    
    do {
        let p = try PreviewData()
        
        return SessionTabView()
            .modelContainer(p.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
    
}
