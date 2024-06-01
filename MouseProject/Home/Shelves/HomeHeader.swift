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
    let weekTitle: String
    let weeklyHeaderImageUrl: String
    let weeklyPreviewUrl: String
    
    @State private var isPreviewing = false
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: weeklyHeaderImageUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Color.black.opacity(0.2))
                        
                case .failure:
                    Rectangle()
                        .background(.blue)
                       // .frame(height: 400)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(height: 450)
            
            
            
            VStack {
                Spacer()
                
                Text(weekTitle)
                    .font(.title)
                
                
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
                    if let url = URL(string: weeklyPreviewUrl) {
                        VideoPlayer(player: AVPlayer(url: url))
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
#Preview {
   HomeHeader(weekTitle: "Testing", weeklyHeaderImageUrl: "https://www.apple.com/v/apple-fitness-plus/z/images/overview/trainers/hero/trainers_hero__w5qafq0jxrmq_large_2x.jpg", weeklyPreviewUrl: "https://youtu.be/Q04S_NkRHGw")
}
