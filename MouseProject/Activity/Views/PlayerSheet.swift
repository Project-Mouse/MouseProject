//
//  PlayerSheet.swift
//  MouseProject
//
//  Created by Imran razak on 02/06/2024.
//

import SwiftUI
import MusicKit

import SwiftUI
import MusicKit

struct PlayerSheet: View {
    @StateObject var musicKitManager = MusicKitManager()
    let trackID = "1560735424"

    var body: some View {
        ZStack {
            DeepBlueGradient()
            
            VStack {
                if musicKitManager.isAuthorized {
                    if let song = musicKitManager.currentSong {
                        VStack {
                            if let artworkURL = song.artwork?.url(width: 300, height: 300) {
                                AsyncImage(url: artworkURL) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 380, height: 380)
                                .cornerRadius(8)
                            }
                            Text(song.title)
                                .font(.title2.bold())
                            Text(song.artistName)
                            
                            Spacer()
                            
                            playButtonRow
                            
                            Spacer()
                        }
                        .padding()
                    } else {
                        Text("Loading...")
                            .task {
                                await musicKitManager.fetchSong(with: trackID)
                            }
                    }
                } else {
                    VStack {
                        Text("Requesting authorization...")
                        Button("Retry Authorization") {
                            musicKitManager.requestAuthorization()
                        }
                    }
                    .onAppear {
                        musicKitManager.requestAuthorization()
                    }
                }
            }
        }
    }

    // Update the playButtonRow to use a boolean value directly for the .animation() modifier
    private var playButtonRow: some View {
        HStack {
            Button(action: {
                musicKitManager.handlePlayButtonSelected()
            }) {
                Image(systemName: (musicKitManager.isPlaying ? "pause.fill" : "play.fill"))
                    .font(.system(size: 50))
            }
            .buttonStyle(.plain) // Use plain button style
            .animation(.easeInOut(duration: 0.1), value: musicKitManager.isPlaying)
        }
    }
}

#Preview {
    PlayerSheet()
}
