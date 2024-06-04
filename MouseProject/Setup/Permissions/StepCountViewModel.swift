//
//  StepCountViewModel.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import Foundation
import HealthKit
import WatchConnectivity

class StepCountViewModel: NSObject, HKWorkoutSessionDelegate, WCSessionDelegate, ObservableObject {
    
    // Properties
    var workoutSession: HKWorkoutSession?
    var heartRateSamples: [HKQuantitySample] = []
    var workoutStartDate: Date?
    var workoutEndDate: Date?
    var distance: Double = 0 // in meters
    var duration: TimeInterval = 0 // in seconds
    var pace: TimeInterval = 0 // in seconds per mile
    
    // Completion handler to update UI
    var updateHandler: (() -> Void)?
    
    // HealthKit store
    let healthStore = HKHealthStore()
    
    // WatchConnectivity session
    private var watchSession: WCSession?
    
    override init() {
        super.init()
        authorizeHealthKit()
        setupWatchConnectivity()
    }
    
    // Request authorization to access HealthKit data
    func authorizeHealthKit() {
        let typesToRead: Set<HKObjectType> = [
            HKObjectType.workoutType(),
            HKObjectType.quantityType(forIdentifier: .heartRate)!
        ]
        
        healthStore.requestAuthorization(toShare: nil, read: typesToRead) { (success, error) in
            if !success {
                print("HealthKit Authorization Failed: \(String(describing: error))")
            }
        }
    }
    
    // Start workout session
    func startWorkoutSession() {
        let workoutConfiguration = HKWorkoutConfiguration()
        workoutConfiguration.activityType = .running // Adjust activity type as needed
        
        do {
            #if os(watchOS)
            workoutSession = try HKWorkoutSession(configuration: workoutConfiguration)
            workoutSession?.delegate = self
            healthStore.start(workoutSession!)
            
            // Send message to open watchOS app
            sendMessageToOpenWatchApp()
            #endif
        } catch {
            print("Unable to start workout session: \(error.localizedDescription)")
        }
    }
    
    // End workout session
    func endWorkoutSession() {
        #if os(watchOS)
        healthStore.end(workoutSession!)
        #endif
    }
    
    // MARK: - HKWorkoutSessionDelegate
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didFailWithError error: Error) {
        print("Workout session failed with error: \(error.localizedDescription)")
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didGenerate event: HKWorkoutEvent) {
        // Handle workout events if needed
    }
    
    func workoutSession(_ workoutSession: HKWorkoutSession, didChangeTo toState: HKWorkoutSessionState, from fromState: HKWorkoutSessionState, date: Date) {
        switch toState {
        case .running:
            workoutStartDate = date
            // Reset previous data
            heartRateSamples.removeAll()
            distance = 0
            duration = 0
            pace = 0
        case .ended:
            workoutEndDate = date
            calculateWorkoutData()
        default:
            break
        }
    }
    
    // Calculate workout data
    func calculateWorkoutData() {
        // Calculate duration
        if let startDate = workoutStartDate, let endDate = workoutEndDate {
            duration = endDate.timeIntervalSince(startDate)
        }
        
        // Calculate pace
        if distance > 0 && duration > 0 {
            let miles = distance / 1609.34 // Convert meters to miles
            pace = duration / miles
        }
        
        // Update UI
        updateHandler?()
    }
    
    // Fetch heart rate samples during workout
    func fetchHeartRateSamples() {
        guard let workoutStartDate = workoutStartDate, let workoutEndDate = workoutEndDate else {
            return
        }
        
        let predicate = HKQuery.predicateForSamples(withStart: workoutStartDate, end: workoutEndDate, options: .strictStartDate)
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: true)
        let heartRateType = HKObjectType.quantityType(forIdentifier: .heartRate)!
        
        let query = HKSampleQuery(sampleType: heartRateType, predicate: predicate, limit: Int(HKObjectQueryNoLimit), sortDescriptors: [sortDescriptor]) { (query, results, error) in
            guard let samples = results as? [HKQuantitySample], error == nil else {
                print("Error fetching heart rate samples: \(String(describing: error))")
                return
            }
            
            self.heartRateSamples.append(contentsOf: samples)
            // Handle heart rate samples as needed
        }
        
        healthStore.execute(query)
    }
    
    // MARK: - WatchConnectivity
    
    private func setupWatchConnectivity() {
        if WCSession.isSupported() {
            watchSession = WCSession.default
            watchSession?.delegate = self
            watchSession?.activate()
        }
    }
    
    private func sendMessageToOpenWatchApp() {
        guard let watchSession = watchSession, watchSession.activationState == .activated else {
            return
        }
        
        watchSession.sendMessage(["OpenApp": true], replyHandler: nil) { (error: Error?) in
            if let error = error {
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - WCSessionDelegate
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        if activationState == .activated {
            // Session is activated
            print("WatchConnectivity session activated")
        } else {
            // Session is not activated
            print("WatchConnectivity session activation failed: \(String(describing: error))")
        }
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("WatchConnectivity session became inactive")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("WatchConnectivity session deactivated")
    }
}
