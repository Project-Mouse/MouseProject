//
//  GoalPicker.swift
//  MouseProject
//
//  Created by Imran razak on 01/06/2024.
//

import SwiftUI

struct GoalPicker: View {
    @State private var goals: [Goals] = []
    @State private var selectedGoal: Goals? = nil // Track selected goal
    
    let apiService: APIService = APIService()
    
    var body: some View {
        NavigationStack {
                ForEach(goals) { goal in
                    NavigationLink(destination: PlanPicker(selectedGoal: goal, planPreviews: goal.planPreviews)) {
                        VStack(alignment: .leading) {
                            AsyncImage(url: URL(string: goal.goalImage))
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 200) // Adjust size as needed
                                .cornerRadius(8)
                            
                            Text(goal.goalName)
                                .font(.headline)
                        }
                        .padding()
                    }
                }
            .navigationTitle("Goals")
        }
        .onAppear {
            Task {
                self.goals = try await self.apiService.listGoals()
            }
        }
    }
}




#Preview {
    GoalPicker()
}
