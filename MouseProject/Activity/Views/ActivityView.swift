//
//  ActivityView.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//

import SwiftUI
import MusicKit
import os
import HealthKit

struct ActivityView: View {
    @StateObject var musicKitManager = MusicKitManager()
    @EnvironmentObject var workoutManager: WorkoutManager
    
    let trackID = "1560735424"
    
    @State private var isShowingWeapped: Bool = false
    
    var body: some View {
        let fromDate = workoutManager.session?.startDate ?? Date()
        let schedule = MetricsTimelineSchedule(from: fromDate, isPaused: workoutManager.sessionState == .paused)
        
        ZStack{
            DeepBlueGradient()
            
            //End Button
            VStack{
                HStack{
                    Spacer()
                    
                    Button{
                        //End Workout
                        workoutManager.session?.stopActivity(with: .now )
                        //Show Wrapped
                        isShowingWeapped.toggle()
                        
                    }label: {
                        Text("End")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .frame(width: 90)
                    .padding()
                    .background(.red)
                    .cornerRadius(12.0)
                }
                .padding()
                
                
                
                //Coaching
                HStack{
                    VStack(alignment: .leading){
                        Text("Coaching")
                            .foregroundColor(.cyan)
                            .font(.headline)
                        
                        Text("""
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

""")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding([.leading, .trailing], 30)
                
                
                //Performance Bar
                
                
                
                //Stats
                StatsView()
                
                Spacer()
                
                //Workout Controls
                HStack {
                    VStack {
                        Button {
                            if let session = workoutManager.session {
                                workoutManager.sessionState == .running ? session.pause() : session.resume()
                            }
                        } label: {
                            let systemImage = workoutManager.sessionState == .running ? "pause.fill" : "play.fill"
                            Image(systemName: systemImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                        }
                        .disabled(!workoutManager.sessionState.isActive)
                    }
                }
                
                Spacer()
                
                
                //PlayerView
                PlayerView()
                    .padding(.bottom)
                
            }
        }
        .fullScreenCover(isPresented: $isShowingWeapped){
            WrappedView()
        }
    }
}

#Preview {
    ActivityView()
        .environmentObject(WorkoutManager())
}
