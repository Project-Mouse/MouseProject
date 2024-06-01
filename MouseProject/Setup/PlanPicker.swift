//
//  PlanPicker.swift
//  MouseProject
//
//  Created by Imran razak on 01/06/2024.
//

import SwiftUI
import AVKit
import AVFoundation
import SwiftData

struct PlanPicker: View {
    var selectedGoal: Goals?
    let planPreviews: [PlanPreviews]
    @State private var selectedPlanIdentifier: Int?
    
    @State private var isPreviewing: Bool = false
    @State private var selectedPreview: PlanPreviews? = nil // Track selected plan preview
    @Environment(\.modelContext) private var context //SwiftData Model Context
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(planPreviews) { preview in
                    ZStack(alignment: .bottomLeading) {
                        AsyncImage(url: URL(string: preview.previewImage))
                            .frame(height: 250)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(12)
                        
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("\(preview.planName)")
                                .font(.title)
                                .fontWeight(.bold)
                            Text("Duration: \(preview.planDuration)")
                                .font(.subheadline)
                            HStack {
                                Button(action: {
                                    isPreviewing.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: "play.fill")
                                        Text("Preview")
                                    }
                                    .padding()
                                    .background(Color(.systemGray6))
                                    .foregroundColor(.white)
                                    .cornerRadius(8)
                                }
                                .padding(.trailing, 8)
                            }
                            
                        }
                        .foregroundColor(.white)
                        .padding()
                        
                        
                        //Selection Button
                        Button(action: {
                            selectedPreview = preview
                            selectedPlanIdentifier = preview.planIdentifier
                        }) {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(selectedPlanIdentifier == preview.planIdentifier ? .blue : .gray)
                                .overlay(
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.white)
                                )
                                .padding(8)
                        }
                        .padding(.top, 8)
                        .padding(.trailing, 8)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
            .sheet(isPresented: $isPreviewing) {
                if let preview = selectedPreview,
                   let url = URL(string: preview.planPreviewVideo) {
                    VideoPlayer(player: AVPlayer(url: url))
                }
            }
        }
    }
    
    //Swift Data saving Selected Plan
    func savePlan() {
        guard let selectedGoal = selectedGoal,
              let planIdentifier = selectedPlanIdentifier else {
            return
        }
        
        let startDate = Date() // Use the current date as the start date
        
        let plan = TrainingPlan(selectedGoal: selectedGoal.goalName,
                                planIdentifier: planIdentifier,
                                startDate: startDate)
        
        context.insert(plan)
        
        print("Saved Plan to Swift Data")
    }
}


#Preview {
    PlanPicker(selectedGoal: nil, planPreviews: [
        PlanPreviews(id: UUID().uuidString
                     , planIdentifier: 1, planName: "Plan 1", previewImage: "30 days", planPreviewVideo: "https://example.com/preview1.mp4", planDuration: 10),
        
    ])
}

