//
//  ChooseGoal.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI


struct ChooseGoal: View {
    @State private var selectedGoal: Goals? = nil // Use an optional Goals to track the selected goal
    @State private var goals: [Goals] = [] // State variable to hold fetched goals

    let apiService: APIService = APIService()

    var body: some View {
        NavigationStack {
            VStack {
                Text("Choose a goal you want to achieve. After you achieve this you will focus on another goal again.")
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(goals) { goal in
                            NavigationLink(
                                destination: ChooseTrainingPlan(selectedGoal: goal),
                                tag: goal,
                                selection: $selectedGoal
                            ) {
                                VStack {
                                    AsyncImage(url: URL(string: goal.artwork)) { image in
                                        image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 150, height: 150)
                                            .cornerRadius(12)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 150, height: 150)
                                    }
                                    Text(goal.title)
                                        .fontWeight(selectedGoal?.goalNumber == goal.goalNumber ? .bold : .regular)
                                        .padding()
                                }
                                .frame(width: 180, height: 200)
                            }
                            .buttonStyle(PlainButtonStyle()) // Remove default button style to avoid navigation issues
                        }
                    }
                    .padding()
                }
                .onAppear {
                    Task {
                        do {
                            self.goals = try await self.apiService.listGoals()
                            print("Goals:", self.goals) // Debug print
                        } catch {
                            // Handle error
                            print("Error: \(error)")
                        }
                    }
                }

                Spacer()
            }
            .navigationTitle("What's your goal?")
            .preferredColorScheme(.dark)
        }
    }
}






#Preview {
    ChooseGoal()
}
