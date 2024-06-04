//
//  StatsView.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//
/*
 Abstract:
 A SwiftUI view that controls the mirroring workout session and presents the metrics.
 */

import os
import SwiftUI
import HealthKit

struct StatsView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    
    var body: some View {
        let fromDate = workoutManager.session?.startDate ?? Date()
        let schedule = MetricsTimelineSchedule(from: fromDate, isPaused: workoutManager.sessionState == .paused)
        
        HStack {
            VStack(alignment: .center) {
                Text("❤️")
                    .font(.system(size: 30))
                Text("\(workoutManager.heartRate, specifier: "%.0f")")
                    .bold()
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
            }
            .padding()
            
            VStack(alignment: .center) {
                ElapsedTimeView(elapsedTime: workoutManager.elapsedTimeInterval, showSubseconds: true)
                    .foregroundColor(.yellow)
            }
            .padding()
            
            VStack {
                Text("🏃")
                    .font(.system(size: 30))
                Text("\(String(format: "%.2f", workoutManager.distance / 1609.34)) mi")
                    .bold()
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
            }
            .padding()
        }
        .font(.system(size: 23))
    }
}

#Preview {
    StatsView()
        .environmentObject(WorkoutManager())
}
