//
//  PermissionsView.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import SwiftUI

struct HealthPermissionView: View {
    @StateObject private var healthKitManager = StepCountViewModel()
    @State private var showNextView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(systemName: "heart.text.square.fill")
                .font(.system(size: 35))
                .foregroundColor(.red)
                .padding([.top, .bottom], 10)
            Text("Health App")
                .font(.headline)
            
            Text("We will only read your step count from the Health App to give you Feel Good Points for your everday movement ")
                .padding(.bottom)
            
            Spacer()
            
            Button{
                showNextView.toggle()
            } label: {
                Text("Next")
                    .padding()
                    .frame(width: 350, height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
            
        }
        .padding()
        .fullScreenCover(isPresented: $showNextView) {
            GoalPicker()
        }
    }
}

#Preview {
    HealthPermissionView()
}
