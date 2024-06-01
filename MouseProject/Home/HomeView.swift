//
//  HomeView.swift
//  MouseProject
//
//  Created by Imran razak on 01/06/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var plans: [Plans] = []
    let apiService: APIService = APIService()
    let currentWeekNumber: Int = 1
    let planIdentifier: Int = 1
    @State private var selectedWeek: Int = 1 // Selected week, default to 1
    
    var body: some View {
        NavigationStack {
            List {
                // Display HomeHeader
                ForEach(plans.filter { $0.planIdentifier == planIdentifier }) { plan in
                    if let currentWeekPlan = plan.weeklyPlans.first(where: { $0.weekNumber == currentWeekNumber }) {
                        HomeHeader(weekTitle: currentWeekPlan.weekTitle,
                                   weeklyHeaderImageUrl: currentWeekPlan.weeklyHeaderImage,
                                   weeklyPreviewUrl: currentWeekPlan.weekPreviewUrl)
                    }
                }
                
                Menu {
                    ForEach(1..<numberOfWeeks() + 1, id: \.self) { week in
                        Button(action: {
                            selectedWeek = week
                        }) {
                            Text("Week \(week)")
                                .padding()
                                .foregroundColor(.primary)
                        }
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(12)
                    }
                } label: {
                    HStack{
                        Text("Week \(selectedWeek)")
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                }
                .menuStyle(ButtonMenuStyle())
                
                
                // Display RunViews for the selected week
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack {
                        ForEach(selectedWeekRuns(), id: \.id) { run in
                            NavigationLink(destination: DetailRunView(run: run)) {
                                RunView(runThumbnail: run.runThumbnail,
                                        runTitle: run.runTitle,
                                        runDuration: "\(run.runDuration) mins")
                            }
                        }
                    }
                }

            }
            .listStyle(PlainListStyle())
            .edgesIgnoringSafeArea(.top)
            .navigationTitle("Weekly Plans")
            .preferredColorScheme(.dark)
            .onAppear {
                Task {
                    self.plans = try await self.apiService.listPlans()
                }
            }
            .toolbar {
                
                //Profile Placeholder
                Circle()
                    .frame(height: 35)
            }
        }
    }
    
    // Function to filter runs for the selected week
    func selectedWeekRuns() -> [Run] {
        return plans.flatMap { $0.weeklyPlans }
            .filter { $0.weekNumber == selectedWeek }
            .flatMap { $0.weekRuns }
    }
    
    // Function to get the maximum week number from plans
    func numberOfWeeks() -> Int {
        return plans.flatMap { $0.weeklyPlans }.map { $0.weekNumber }.max() ?? 1
    }
    
}

#Preview {
    HomeView()
}
