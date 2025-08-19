//
//  ActivityChartView.swift
//  jim
//
//  Created by jenda on 27.07.2025.
//

import SwiftUI

struct ActivityChartView: View {
    
    internal var spacing: CGFloat = 4.0
    
    var body: some View {
        
        HStack{
            
            Grid(horizontalSpacing: spacing, verticalSpacing: spacing) {
                
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
                        .font(.system(size: 10.0))
                        
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
    internal var size: CGFloat = 13
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 2)
            .fill(active ? .green.opacity(0.5) : .gray.opacity(0.2) )
            .frame(maxWidth: size, maxHeight: size)
            .aspectRatio(1, contentMode: .fit)
    }
}


#Preview {
    ActivityChartView()
}
