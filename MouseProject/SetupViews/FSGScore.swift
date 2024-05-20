//
//  FSGScore.swift
//  MouseProject
//
//  Created by Imran razak on 20/05/2024.
//

import SwiftUI

struct FSGScore: View {
    var body: some View {
        VStack(spacing: 20) {
            
            VStack(alignment: .leading){
                // Title
                Text("Your Feel Good Goal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Subtitle
                Text("One Metric. That's all you have to work towards everday. When you workout, you increase your daily score towards the goal below. If you take some rest, your score will go up helping you get your Feel Good Goal.")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            // Circle with the number inside
            ZStack {
                Circle()
                    .fill(Color.green)
                    .frame(width: 200, height: 200)
                
                Text("460")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Get Started Button
            Button(action: {
                // Action for the button
            }) {
                Text("Get Started")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
        }
        .padding()
    }
}

#Preview {
    FSGScore()
}
