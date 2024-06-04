//
//  MusicPermission.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//

import SwiftUI
import HealthKit
import WatchConnectivity

struct MusicPermission: View {
    @StateObject var musicKitManager = MusicKitManager()
    @ObservedObject var workoutViewModel: StepCountViewModel

    @State private var showNextView: Bool = false
    var body: some View {
        ZStack{
            DeepBlueGradient()
            
            VStack(alignment: .leading) {
                Image(systemName: "airpodspro")
                    .font(.system(size: 35))
                    .foregroundColor(.red)
                    .padding([.top, .bottom], 10)
                Text("Music")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                
                Text("We need permission to use your Apple Music to share some great music with you we've chosen for each run.")
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                Spacer()
                
                Button{
                    workoutViewModel.startWorkoutSession()
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
                musicKitManager.requestAuthorization()
            }
            .padding()
            .fullScreenCover(isPresented: $showNextView) {
               // GoalPicker()
                ActivityView()
            }
        }
    }
}

#Preview {
    MusicPermission(workoutViewModel: StepCountViewModel())
}
