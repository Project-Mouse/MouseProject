import Foundation
import MusicKit
import SwiftUI


class MusicKitManager: ObservableObject {
    @Published var currentSong: Song?
    @Published var isAuthorized = false

    // The MusicKit player to use for Apple Music playback.
    private let player = ApplicationMusicPlayer.shared

    /// The state of the MusicKit player to use for Apple Music playback.
    @ObservedObject var playerState = ApplicationMusicPlayer.shared.state

    /// `true` when the album detail view sets a playback queue on the player.
    @Published private var isPlaybackQueueSet = false


    /// `true` when the player is playing.
    var isPlaying: Bool {
        return (playerState.playbackStatus == .playing)
    }


    /// The Apple Music subscription of the current user.
    @Published private var musicSubscription: MusicSubscription?

    init() {
        requestAuthorization()
    }

    func requestAuthorization() {
        Task {
            do {
                let status = await MusicAuthorization.request()
                DispatchQueue.main.async {
                    self.isAuthorized = status == .authorized
                }
            } catch {
                print("Authorization request failed: \(error)")
            }
        }
    }

    func fetchSong(with id: String) async {
        guard isAuthorized else {
            print("Not authorized to access Apple Music")
            return
        }

        do {
            let request = MusicCatalogResourceRequest<Song>(matching: \.id, equalTo: MusicItemID(id))
            let response = try await request.response()
            if let song = response.items.first {
                DispatchQueue.main.async {
                    self.currentSong = song
                    self.playSong(song)
                }
            }
        } catch {
            print("Error fetching song: \(error)")
        }
    }

    func playSong(_ song: Song) {
        player.queue = [song]
        isPlaybackQueueSet = true
        beginPlaying()
    }

    func play() {
        Task {
            do {
                try await player.play()
            } catch {
                print("Failed to resume playing with error: \(error).")
            }
        }
    }

    func pause() {
        player.pause()
    }

    func handlePlayButtonSelected() {
        if !isPlaying {
            if !isPlaybackQueueSet {
                // Set up playback queue and begin playing
                if let currentSong = currentSong {
                    player.queue = [currentSong]
                    isPlaybackQueueSet = true
                    beginPlaying()
                }
            } else {
                // Resume playback
                play()
            }
        } else {
            // Pause playback
            pause()
        }
        
    }

    private func beginPlaying() {
        Task {
            do {
                try await player.play()
            } catch {
                print("Failed to prepare to play with error: \(error).")
            }
        }
    }
}


