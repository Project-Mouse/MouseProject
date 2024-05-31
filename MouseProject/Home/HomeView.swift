//
//  HomeView.swift
//  MouseProject
//
//  Created by Imran razak on 22/05/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var selectedWeek = 1
    let weeks = ["Week 1", "Week 2", "Week 3"] // Add more weeks as needed
    let apiService: APIService = APIService()
    
    @State private var goals: [Goals] = []
    
    @Query var trainingPlan: [TrainingPlan]
    var ChosenPlan: TrainingPlan? { trainingPlan.first}
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                //DEBUG ONLY for Trianing Plans
                /*
                Text("Training Plans: \(trainingPlan)") // Print trainingPlans
                Text("Chosen Plan: \(String(describing: ChosenPlan))")
                 
                 */
                
                if let goal = goals.first(where: { $0.title == "TestGoal" }), // Manually input the training plan name
                             let plan = goal.plans.first(where: { $0.weeklyPreview.contains(where: { $0.weekNo == selectedWeek }) }),
                             let preview = plan.weeklyPreview.first(where: { $0.weekNo == selectedWeek }) {
                              HomeHeader(trainingPlan: "PlanName", // Manually input the training plan name
                                         weekNumber: selectedWeek,
                                         previewURL: preview.previewUrl,
                                         headerImageURL: plan.headerImage)
                          } else {
                              Text("No data available for the selected week")
                          }
                
                /*
                if let chosenPlan = ChosenPlan {
                    Text("Chosen Plan: \(chosenPlan)") // Print the chosen plan
                    if let goal = goals.first(where: { $0.title == chosenPlan.planName }) {
                        if let plan = goal.plans.first {
                            let previewIndex = selectedWeek - 1
                            if previewIndex < plan.weeklyPreview.count {
                                let preview = plan.weeklyPreview[previewIndex]
                                HomeHeader(trainingPlan: chosenPlan.planName,
                                           weekNumber: selectedWeek,
                                           previewURL: preview.previewUrl,
                                           headerImageURL: plan.headerImage)
                            } else {
                                Text("Preview index out of range")
                            }
                        } else {
                            Text("No plans found for the goal")
                        }
                    } else {
                        Text("No goal found for the chosen plan")
                    }
                } else {
                    Text("No plan selected")
                }
                */
                
                
                
                HStack{
                    Picker(selection: $selectedWeek, label: Text("Week")) {
                        ForEach(0..<weeks.count, id: \.self) { index in
                            Text(weeks[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    
                    Spacer()
                }
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        RunView(imageName: "run1", title: "Feel Good Run", duration: "10 mins")
                        RunView(imageName: "run2", title: "Feel Good Run", duration: "20 mins")
                        RunView(imageName: "run3", title: "Feel Good Run", duration: "15 mins")
                    }
                }
                .padding([.leading, .top])
                
                VStack(alignment: .leading) {
                    Text("Curated Runs")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding([.leading, .top])
                    
                    Text("Handpicked to help you achieve your goal.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding([.leading, .bottom])
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(0..<3) { _ in
                                CuratedRun()
                            }
                        }
                        
                    }
                    .padding(.leading)
                }
                
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
            
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("Training")
            .preferredColorScheme(.dark)
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem{
                    Circle()
                        .frame(height: 35)
                }
            }
            
        }
    }
    
    //Update Runs based on Week Selected
    
    //Check and update Header View based on Week
    
}
#Preview {
    HomeView()
}
