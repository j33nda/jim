//
//  WeightDataPoint.swift
//  jim
//
//  Created by jenda on 19.08.2025.
//


import SwiftUI
import HealthKit
import HealthKitUI
import Charts

struct WeightDataPoint: Identifiable, Hashable {
    var id = UUID()
    var day: Date
    var weight: Double
    
    init( _ weight: Double, _ day: Date) {
        self.day = day
        self.weight = weight
    }
}
