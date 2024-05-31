//
//  HomeHeader.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI
import AVFoundation
import AVKit

struct HomeHeader: View {
    let trainingPlan: String
    let weekNumber: Int
    let previewURL: String
    let headerImageURL: String
    
    @State private var isPreviewing = false
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: headerImageURL)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        //.frame(height: 400)
                case .failure:
                    Rectangle()
                        .background(.blue)
                       // .frame(height: 400)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 450)
           // .ignoresSafeArea(edges: .top)
            
            
            
            VStack {
                Spacer()
                
                Text(trainingPlan)
                    .font(.title)
                
                Text("Week \(weekNumber)")
                
                Button(action: {
                    isPreviewing.toggle()
                }) {
                    Text("Preview")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                .sheet(isPresented: $isPreviewing) {
                    if let url = URL(string: previewURL) {
                        VideoPlayer(player: AVPlayer(url: url))
                    }
                }
            }
        }
    }
}
#Preview {
    HomeHeader(trainingPlan: "Testing", weekNumber: 1, previewURL: "https://www.apple.com/105/media/uk/apple-fitness-plus/2023/366c638f-0f8f-46d7-993c-03b74a09e296/anim/overview-hero/large_2x.mov", headerImageURL: "https://www.apple.com/v/apple-fitness-plus/y/images/overview/trainers/hero/trainers_hero__w5qafq0jxrmq_large_2x.jpg")
}
