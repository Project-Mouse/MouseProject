//
//  TabViews.swift
//  WatchMouse Watch App
//
//  Created by Imran razak on 04/06/2024.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView{
            WatchWorkoutSession()
                .tabItem {
                    Label("", systemImage: "circle.fill")
                }
            
            ContentView()
        }
    }
}

#Preview {
    TabViews()
}
