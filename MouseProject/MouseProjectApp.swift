//
//  MouseProjectApp.swift
//  MouseProject
//
//  Created by Imran razak on 20/05/2024.
//

import SwiftUI
import FirebaseCore
import SwiftData

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}


@main
struct MouseProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            PlayerSheet()
              .modelContainer(for: TrainingPlan.self)
              .preferredColorScheme(.dark)
        }
    }
}
