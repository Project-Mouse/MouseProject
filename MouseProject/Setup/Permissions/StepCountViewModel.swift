//
//  StepCountViewModel.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import Foundation
import HealthKit

// HealthKitManager responsible for managing HealthKit interactions
//If Step Count is needed for View, turn into Observable Object with Published Variable

// HealthKitManager responsible for managing HealthKit interactions
class StepCountViewModel: ObservableObject {
    private let healthStore = HKHealthStore()
    
    // Published property to hold the user's step count
    @Published var stepCount: Int?
    
    init() {
        requestAuthorization()
    }
    
    // Function to request authorization to read step count data
    internal func requestAuthorization() {
        let stepType = HKObjectType.quantityType(forIdentifier: .stepCount)!
        
        // Request authorization from the user
        healthStore.requestAuthorization(toShare: nil, read: [stepType]) { success, error in
            if success {
                // Authorization granted, query step count data
                self.queryStepCount()
            } else {
                // Authorization denied or error occurred
                print("Error: \(error?.localizedDescription ?? "Authorization Denied")")
            }
        }
    }
    
    // Function to query step count data
    private func queryStepCount() {
        // Define the date range for the query (e.g., today)
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        // Define the query
        let query = HKStatisticsQuery(quantityType: HKQuantityType.quantityType(forIdentifier: .stepCount)!, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
            guard let result = result, let sum = result.sumQuantity() else {
                // Handle error
                print("Error: \(error?.localizedDescription ?? "Unknown Error")")
                return
            }
            
            // Update step count
            DispatchQueue.main.async {
                self.stepCount = Int(sum.doubleValue(for: HKUnit.count()))
            }
        }
        
        // Execute the query
        healthStore.execute(query)
    }
}

/*
 // HealthKitManager responsible for the HealthKit data but only for Logic side
 class StepVCountViewModel: ObservableObject {
     private let healthStore = HKHealthStore()
     
     // Published property to hold the user's step count
     @Published var stepCount: Int?
     
     init() {
         requestAuthorization()
     }
     
     // Function to request authorization to read step count data
     private func requestAuthorization() {
         let stepType = HKObjectType.quantityType(forIdentifier: .stepCount)!
         
         // Request authorization from the user
         healthStore.requestAuthorization(toShare: nil, read: [stepType]) { success, error in
             if success {
                 // Authorization granted, query step count data
                 self.queryStepCount()
             } else {
                 // Authorization denied or error occurred
                 print("Error: \(error?.localizedDescription ?? "Authorization Denied")")
             }
         }
     }
     
     // Function to query step count data
     private func queryStepCount() {
         // Define the date range for the query (e.g., today)
         let calendar = Calendar.current
         let now = Date()
         let startOfDay = calendar.startOfDay(for: now)
         let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
         
         // Define the query
         let query = HKStatisticsQuery(quantityType: HKQuantityType.quantityType(forIdentifier: .stepCount)!, quantitySamplePredicate: predicate, options: .cumulativeSum) { query, result, error in
             guard let result = result, let sum = result.sumQuantity() else {
                 // Handle error
                 print("Error: \(error?.localizedDescription ?? "Unknown Error")")
                 return
             }
             
             // Update step count
             DispatchQueue.main.async {
                 self.stepCount = Int(sum.doubleValue(for: HKUnit.count()))
             }
         }
         
         // Execute the query
         healthStore.execute(query)
     }
 }

 // Example of a logic component that listens for changes to step count data
 class StepCountLogic {
     private var healthKitManager: HealthKitManager
     
     init(healthKitManager: HealthKitManager) {
         self.healthKitManager = healthKitManager
         
         // Subscribe to changes in step count
         self.healthKitManager.$stepCount.sink { stepCount in
             // Perform logic based on the updated step count
             if let stepCount = stepCount {
                 print("Step Count Updated: \(stepCount)")
                 // Perform additional logic here...
             } else {
                 print("Step Count Unavailable")
             }
         }
     }
 }
 */
