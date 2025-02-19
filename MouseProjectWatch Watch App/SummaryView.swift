//
//  SummaryView.swift
//  MouseProjectWatch Watch App
//
//  Created by Imran razak on 04/06/2024.
//
/*

Abstract:
A SwiftUI view that shows the workout summary information.
*/

import Foundation
import HealthKit
import SwiftUI

struct SummaryView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @Environment(\.dismiss) var dismiss

    var body: some View {
        if let workout = workoutManager.workout {
            ScrollView {
                summaryListView(workout: workout)
                    .scenePadding()
            }
            .navigationTitle("Summary")
            .navigationBarTitleDisplayMode(.inline)
        } else {
            ProgressView("Saving Workout")
                .navigationBarHidden(true)
        }
    }
    
    @ViewBuilder
    private func summaryListView(workout: HKWorkout) -> some View {
        VStack(alignment: .leading) {
            SummaryMetricView(title: "Total Time", value: workout.totalTime)
                .foregroundStyle(.yellow)
            
            SummaryMetricView(title: "Avg. Speed", value: workout.averageCyclingSpeed)
                .foregroundStyle(.green)
            
            SummaryMetricView(title: "Avg. Power", value: workout.averageCyclingPower)
                .foregroundStyle(.pink)
            
            SummaryMetricView(title: "Avg. Cadence", value: workout.averageCyclingCadence)
                .foregroundStyle(.white)
            
            SummaryMetricView(title: "Total Distance", value: workout.totalCyclingDistance)
                .foregroundStyle(.orange)
            
            
            SummaryMetricView(title: "Total Energy", value: workout.totalEnergy)
                .foregroundStyle(.pink)
            
            SummaryMetricView(title: "Avg. Heart Rate", value: workout.averageHeartRate)
                .foregroundStyle(.red)
            
            Group {
                Button {
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
        }
    }
}

struct SummaryMetricView: View {
    var title: String
    var value: String

    var body: some View {
        Text(title)
            .foregroundStyle(.foreground)
        Text(value)
            .font(.system(.title2, design: .rounded).lowercaseSmallCaps())
        Divider()
    }
}
