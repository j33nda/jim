//
//  ActivityChartView.swift
//  jim
//
//  Created by jenda on 27.07.2025.
//

import SwiftUI

struct ActivityChartView: View {
    
    var body: some View {
        
        HStack{
            
            Grid(horizontalSpacing: 5, verticalSpacing: 5) {
                
                ForEach(0..<7) { row in
                    
                    GridRow {
                        
                        Group{
                            switch row {
                            case 0: Text("Mon")
                            case 3: Text("Wed")
                            case 6: Text("Sun")
                            default: Text("")
                            }
                        }
                        .gridColumnAlignment(.trailing)
                        .bold()
                        .font(.caption)
                        
                        ForEach(0..<12) { column in
                            
                            ActivityRectangle(active: (row * column + 1) % 7 == 0)
                        }
                    }
                }
            }
        }
    }
}


struct ActivityRectangle: View {
    
    var active: Bool
    var today: Bool = false
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 2)
            .fill(active ? .green.opacity(0.5) : .gray.opacity(0.2) )
            .frame(maxWidth: 15, maxHeight: 15)
            .aspectRatio(1, contentMode: .fit)
    }
}


#Preview {
    ActivityChartView()
}
