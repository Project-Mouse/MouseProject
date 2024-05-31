//
//  ChooseTrainingPlan.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//
import SwiftUI
import SwiftData

struct ChooseTrainingPlan: View {
    var selectedGoal: Goals // Receive the selected goal from the ChooseGoal view
    
    @Environment(\.modelContext) private var context
    
    @State private var selectedPlanTitle: String? // Variable to store the selected plan title
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("You selected goal \(selectedGoal.title)") // Display the selected goal in the new view
                        .padding()
                    
                    ForEach(selectedGoal.plans, id: \.id) { plan in
                        VStack(alignment: .leading) {
                            ZStack(alignment: .topTrailing) {
                                AsyncImage(url: URL(string: plan.headerImage)) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 280)
                                        .cornerRadius(12)
                                } placeholder: {
                                    ProgressView()
                                        .frame(height: 150)
                                }
                                
                                // Circle overlay
                                Circle()
                                    .foregroundColor(selectedPlanTitle == plan.title ? .green : .blue) // Change color if plan is selected
                                    .frame(width: 30, height: 30)
                                    .onTapGesture {
                                        selectedPlanTitle = plan.title // Set the selected plan title
                                        // You can save the selected plan title here in your variable
                                        
                                        print("Saved in variable")
                                        
                                        saveTrainingPlan()
                                        
                                        print("saved Data")
                                    }
                                    .padding(8)
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
    //Save Training Plan
    func saveTrainingPlan() {
        let trainingPlan = TrainingPlan(selectedGoal: selectedGoal.title, planName: selectedPlanTitle!)
    }
    
}


#Preview {
    ChooseTrainingPlan(selectedGoal: Goals(goalNumber: 1, artwork: "", title: "", plans: []))
}
