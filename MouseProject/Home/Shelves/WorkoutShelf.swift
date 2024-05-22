//
//  Workouts.swift
//  MouseProject
//
//  Created by Imran razak on 22/05/2024.
//

import SwiftUI

struct WorkoutShelfCard: View {
    var imageName: String
    var title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 100)
                .clipped()
                .cornerRadius(10)
            
            Text(title)
                .font(.headline)
                .padding(.top, 5)
        }
        .frame(width: 150)
    }
}

//Main
struct WorkoutShelf: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Workouts")
                .font(.headline)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    WorkoutShelfCard(imageName: "workout1", title: "Morning Yoga")
                    WorkoutShelfCard(imageName: "workout2", title: "Run")
                    WorkoutShelfCard(imageName: "workout3", title: "Cycling")
                    // Add more cards as needed
                }
                .padding(.vertical)
            }
        }
        .padding()
    }
}

#Preview {
    Workouts()
}
