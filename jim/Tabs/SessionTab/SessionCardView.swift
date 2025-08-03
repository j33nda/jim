//
//  SwiftUIView.swift
//  jim
//
//  Created by jenda on 10.07.2025.
//

import SwiftUI

struct SessionCardView: View {
    
    var duration: Int
    var date: Date
    
    
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 10)
                .fill(
                    LinearGradient(colors: [.blue.opacity(0.4), .gray.opacity(0.2), .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            
            HStack{
                
                VStack{
                    
                    Text(getDate(date: date))
                        .font(.title3)
                        .bold()
                        .frame(alignment: .leading)
                    
                    Spacer()
                }
                
                Spacer()
                
                VStack{
                    
                    Spacer()
                    
                    Text("1:40h")
                        .font(.title3)
                        .bold()
                }
            }
            .padding(8)
        }
        .aspectRatio(2, contentMode: .fit)
    }
    
    func getDate(date: Date) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d. M."
        
        return formatter.string(from: date)
    }
    
}

#Preview {
    SessionCardView(duration: 1, date: Date.now)
}
