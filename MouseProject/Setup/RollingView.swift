//
//  RollingView.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI

//App Permissions

struct RollingView: View {
    @State private var currentTextIndex = 0
    @State private var opacity: Double = 1.0
    @State private var showButton = false
    private let texts = ["Train to Run.", "For the Everyday Pro.", "Only with Apple Watch."]

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text(texts[currentTextIndex])
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .opacity(opacity)
                    .animation(.easeInOut(duration: 1.0), value: opacity)
                    .onAppear {
                        startTextAnimation()
                    }
                Spacer()
                
                if showButton {
                    Button(action: {
                        // Action for the button
                    }) {
                        Text("Get Started")
                            .frame(maxWidth: 300)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            
                    }
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 1.0), value: showButton)
                }
                Spacer()
            }
        }
    }
    
    private func startTextAnimation() {
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { timer in
            withAnimation {
                self.opacity = 0.0
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if self.currentTextIndex < self.texts.count - 1 {
                    self.currentTextIndex += 1
                    withAnimation {
                        self.opacity = 1.0
                    }
                } else {
                    self.showButton = true
                    timer.invalidate() // Stop the timer
                }
            }
        }
    }
}

#Preview {
    RollingView()
}
