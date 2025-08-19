import SwiftUI
import HealthKit
import HealthKitUI
import Charts

struct WeightDataPoint: Identifiable {
    var id = UUID()
    var day: Int
    var weight: Double
    
    init( _ weight: Double, _ day: Int) {
        self.day = day
        self.weight = weight
    }
}