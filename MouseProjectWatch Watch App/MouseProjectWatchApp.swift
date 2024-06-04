//
//  MouseProjectWatchApp.swift
//  MouseProjectWatch Watch App
//
//  Created by Imran razak on 04/06/2024.
//

import SwiftUI

@main
struct MouseProjectWatch_Watch_AppApp: App {
    @WKApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    private let workoutManager = WorkoutManager.shared
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            PagingView()
                .environmentObject(workoutManager)
        }
    }
}
