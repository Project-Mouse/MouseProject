//
//  ChooseTrainingPlan.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI

struct ChooseTrainingPlan: View {
    var selectedGoal: Goals // Receive the selected goal from the ChooseGoal view
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("You selected goal \(selectedGoal.title)") // Display the selected goal in the new view
                    .padding()
                
                ScrollView {
                    ForEach(selectedGoal.plans, id: \.id) { plan in
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: plan.headerImage)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 150)
                                    .cornerRadius(12)
                            } placeholder: {
                                ProgressView()
                                    .frame(height: 150)
                            }
                            Text(plan.title)
                                .font(.headline)
                            Text(plan.topText)
                                .font(.subheadline)
                            Text("Duration: \(plan.duration) weeks")
                                .font(.subheadline)
                        }
                        .padding()
                    }
                }
            }
            .preferredColorScheme(.dark)
            .navigationTitle("Choose a Training Plan")
        }
    }
}
#Preview {
    ChooseTrainingPlan(selectedGoal: Goals(goalNumber: 1, artwork: "", title: "", plans: []))
}
