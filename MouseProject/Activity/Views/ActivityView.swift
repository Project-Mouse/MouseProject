//
//  ActivityView.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//

import SwiftUI
import MusicKit

struct ActivityView: View {
    @StateObject var musicKitManager = MusicKitManager()
    let trackID = "1560735424"
    
    var body: some View {
        ZStack{
            DeepBlueGradient()
            
            //End Button
            VStack{
                HStack{
                    Spacer()
                    
                    Button{
                        //Dismiss View
                        
                        //End Workout
                        
                        //Show Wrapped
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
                        Text("TopText")
                            .foregroundColor(.white)
                            .font(.caption2)
                        
                        Text("Hello")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding([.leading, .trailing], 30)
                //Performance Bar
                
                
                //Stats
                
                
                
                Spacer()
                
                //Workout Controls
                HStack{
                    VStack{
                        Image(systemName: "pause.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 70))
                           
                    }
                }
                
                Spacer()
                
                //PlayerView
                PlayerView()
                    .padding(.bottom)
                
            }
        }
    }
}

#Preview {
    ActivityView()
}
