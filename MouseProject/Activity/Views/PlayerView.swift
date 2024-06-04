//
//  PlayerView.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//

import SwiftUI
import MusicKit

struct PlayerView: View {
    @StateObject var musicKitManager = MusicKitManager()
    let trackID = "1560735424"
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 110)
                .cornerRadius(25)
                .padding()
                .foregroundColor(.black) // Added background color for better visibility
            
            if musicKitManager.isAuthorized {
                HStack {
                    if let artworkURL = musicKitManager.currentSong?.artwork?.url(width: 75, height: 75) {
                        AsyncImage(url: artworkURL) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 75, height: 75)
                        .cornerRadius(12)
                        .padding(.leading, 25)
                    } else {
                        Rectangle()
                            .frame(width: 75, height: 75)
                            .foregroundColor(.gray)
                            .cornerRadius(12)
                            .padding(.leading, 25)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Currently Playing")
                            .foregroundColor(.white)
                            .font(.caption2)
                        Text(musicKitManager.currentSong?.title ?? "Loading...")
                            .bold()
                            .foregroundColor(.white) // Added foreground color for better visibility
                        Text(musicKitManager.currentSong?.artistName ?? "")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    }
                    
                    Spacer() // This pushes the Play/Pause button to the right
                    
                    Button(action: {
                        musicKitManager.handlePlayButtonSelected()
                    }) {
                        Image(systemName: musicKitManager.isPlaying ? "pause.fill" : "play.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 50))
                            .padding(.trailing, 25)
                    }
                    .buttonStyle(.plain) // Use plain button style
                    .animation(.easeInOut(duration: 0.1), value: musicKitManager.isPlaying)
                }
                .padding(.horizontal)
                .onAppear {
                    Task {
                        await musicKitManager.fetchSong(with: trackID)
                    }
                }
            } else {
                VStack {
                    Text("Requesting authorization...")
                        .foregroundColor(.white)
                    Button("Retry Authorization") {
                        musicKitManager.requestAuthorization()
                    }
                    .foregroundColor(.blue)
                }
                .onAppear {
                    musicKitManager.requestAuthorization()
                }
            }
        }
        .onChange(of: musicKitManager.isAuthorized) { isAuthorized in
            if isAuthorized {
                Task {
                    await musicKitManager.fetchSong(with: trackID)
                }
            }
        }
    }
}

#Preview {
    PlayerView()
}
