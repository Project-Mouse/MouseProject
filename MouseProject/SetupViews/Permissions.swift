//
//  Permissions.swift
//  MouseProject
//
//  Created by Imran razak on 20/05/2024.
//

import SwiftUI

struct Permissions: View {
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 20) {
                Text("Permissions Needed")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: "location.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                    Text("Location Permission")
                        .font(.headline)
                    Text("We need access to your location to accurately track your running, walking, and cycling routes. This allows us to provide detailed statistics on your distance, speed, and route maps, helping you monitor your progress and achieve your fitness goals.")
                        .font(.body)
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: "heart.text.square.fill")
                        .foregroundColor(.pink)
                        .font(.title)
                    Text("Health App Permission")
                        .font(.headline)
                    Text("We need access to your Health app data to sync your workouts and activity metrics. This helps in giving you a comprehensive view of your fitness journey by combining the data from our app with other health data collected by your iPhone and Apple Watch.")
                        .font(.body)
                }
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Image(systemName: "hand.raised.app.fill")
                        .foregroundColor(.blue)
                        .font(.title)
                    Text("Privacy")
                        .font(.headline)
                    Text("We are private by design. That means that we don't see your personal information, nor share it with anyone. We collect usage data which helps us improve products/services we offer which is anonmous by default, which means we don't know who anyone is.")
                        .font(.body)
                }
                
                Spacer()
                
                
            }
            .padding()
            //Accept Button
            Button {
                
            }label: {
                Text("Accept")
            }
        }
    }
    
}

#Preview {
    Permissions()
}
