//
//  StatsView.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//

import SwiftUI
import HealthKit

struct StatsView: View {
    @ObservedObject var workoutViewModel = StepCountViewModel()
    
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text("❤️ \n\(workoutViewModel.heartRateSamples.last?.quantity.doubleValue(for: HKUnit.count().unitDivided(by: .minute())) ?? 0, specifier: "%.0f") bpm")
                    .multilineTextAlignment(.center)
            }
            .padding()
            
            VStack(alignment: .center) {
                Text("⏱️ \n\(formattedTimeFromSeconds(workoutViewModel.duration))")
                    .multilineTextAlignment(.center)
            }
            .padding()
            
            VStack {
                Text("🏃 \n\(String(format: "%.2f", workoutViewModel.distance / 1609.34)) miles")
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
        .onAppear {
            workoutViewModel.startWorkoutSession()
            workoutViewModel.updateHandler = {
                // Update UI when workout data changes
            }
        }
        .onDisappear {
            workoutViewModel.endWorkoutSession()
        }
    }
    
    // Function to format time from seconds
    private func formattedTimeFromSeconds(_ seconds: TimeInterval) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: seconds) ?? ""
    }
}

#Preview {
    StatsView()
}
