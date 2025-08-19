//
//  WeightChartView.swift
//  jim
//
//  Created by jenda on 04.08.2025.
//

import SwiftUI
import HealthKit
import HealthKitUI
import Charts


struct WeightChartView: View {
    
    
    let hs = HKHealthStore()
    let readTypes: Set = [HKQuantityType(.bodyMass)]
    let targetWeight: Double = 80
    
    
    @State var trigger = false
    @State var weightDataPoints: [WeightDataPoint] = []
    @State var yDomain: [Double] = [0, 120]
    
    
    var body: some View {
        
        
        Chart(weightDataPoints) { dataPoint in
            
            PointMark(x: .value("day", dataPoint.day ),
                      y: .value("weight", dataPoint.weight ))
            .foregroundStyle(Color.purple)
            
            
            LineMark(x: .value("day", dataPoint.day),
                     y: .value("weight", dataPoint.weight))
            .foregroundStyle(Color.purple)
            
            RuleMark(y: .value("Target Weight", targetWeight))
                .foregroundStyle(Color.black)
                .lineStyle(StrokeStyle(lineWidth: 1, lineCap: .round, dash: [4]))
            
        }
        .chartYScale(domain: yDomain)
        .chartYAxis(content: {
            AxisMarks(position: .leading)
        })
        .padding()
        .frame(height: 130)
        .onAppear {
            if HKHealthStore.isHealthDataAvailable() {
                trigger.toggle()
            }
        }
        .healthDataAccessRequest(store: hs, readTypes: readTypes, trigger: trigger) { result in
            switch result {
            case .success(_):
                if weightDataPoints.isEmpty {
                    readBodyMass()
                }
            case .failure(let failure):
                print("failure \(failure.localizedDescription)")
            }
        }
        
    }
    
    func readBodyMass() {
        let bodyMassType = HKSampleType.quantityType(forIdentifier: .bodyMass)!
        
        let endDay = Date.now
        let threeMonths: TimeInterval = 3600 * 24 * 90
        let startDay = endDay - threeMonths
        let predicate = HKQuery.predicateForSamples(withStart: startDay, end: endDay)
        
        let query = HKSampleQuery(sampleType: bodyMassType, predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, results, error in
            
            guard let querySamples = results as? [HKQuantitySample] else {
                // do smth
                return
            }
            
            
            var temp: [WeightDataPoint] = []
            
            for sample in querySamples {
                
                let day = sample.startDate
                let weight = sample.quantity.doubleValue(for: .gram()) / 1000.0
                temp.append(.init(weight, day))
            }
            
            weightDataPoints = temp
            var yMin: Double = 50
            var yMax: Double = 90
            
            if !temp.isEmpty {
                yMin = min(targetWeight, weightDataPoints.map(\.weight).min()!)
                yMax = max(targetWeight, weightDataPoints.map(\.weight).max()!)
            }
            
            yDomain = [yMin - 2, yMax + 2]
            
        }
        
        hs.execute(query)
    }
}

#Preview {
    WeightChartView(weightDataPoints: [.init(60, Date.now - 3600*24*4 ),
                                       .init(70.2, Date.now - 3600*24*3 ),
                                       .init(71, Date.now - 3600*24*2 ),
                                       .init(90, Date.now - 3600*24*1 )]
    )
}
