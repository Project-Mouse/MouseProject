//
//  PermissionsView.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import os
import SwiftUI
import HealthKitUI
import HealthKit

struct HealthPermissionView: View {
    @EnvironmentObject var workoutManager: WorkoutManager
    @State private var showNextView: Bool = false
    @State private var triggerAuthorization = false
    
    var body: some View {
        ZStack{
            DeepBlueGradient()
            
            VStack(alignment: .leading) {
                Image(systemName: "heart.text.square.fill")
                    .font(.system(size: 35))
                    .foregroundColor(.red)
                    .padding([.top, .bottom], 10)
                Text("Health App")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Text("We will only read your step count from the Health App to give you Feel Good Points for your everday movement ")
                    .foregroundColor(.white)
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
            .onAppear{
                triggerAuthorization.toggle()
            }
            .healthDataAccessRequest(store: workoutManager.healthStore,
                                     shareTypes: workoutManager.typesToShare,
                                     readTypes: workoutManager.typesToRead,
                                     trigger: triggerAuthorization, completion: { result in
                 switch result {
                 case .success(let success):
                     print("\(success) for authorization")
                 case .failure(let error):
                     print("\(error) for authorization")
                 }
             })
            .padding()
            .fullScreenCover(isPresented: $showNextView) {
                MusicPermission()
            }
        }
    }
}

#Preview {
    HealthPermissionView()
}
