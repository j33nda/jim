//
//  SettingsTabView.swift
//  jim
//
//  Created by jenda on 17.08.2025.
//

import SwiftUI

struct SettingsTab: View {
    
    @State var targetWeightIsOn: Bool = false
    @State var targetWeight: String = ""
    
    var body: some View {
        VStack {
            Section("Target Weight") {
                
                Toggle(isOn: $targetWeightIsOn) {
                    Text("Show target weight")
                }
                
                if targetWeightIsOn {
                    TextField("Set target weight", text: $targetWeight)

                }
            }
        }
        .padding()
    }
}

#Preview {
    SettingsTab()
}
