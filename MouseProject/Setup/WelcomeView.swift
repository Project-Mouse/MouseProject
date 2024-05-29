//
//  WelcomeView.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI

struct WelcomeView: View {
    @State private var openNextView: Bool = false
    
    var body: some View {
        ZStack {
            // Background Image
            Image("WelcomeRun") // Replace with your image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            // Overlaying Content
            VStack {
                Spacer()
                
                // Text Content
                VStack(alignment: .leading) {
                    Text("Train to Run.")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    
                    Text("For the Everyday Pro.\nOnly with Apple Watch.")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                    
                    // Button
                    Button(action: {
                        // Action for the button
                        openNextView.toggle()
                    }) {
                        Text("Try 1 month free")
                            .bold()
                            .frame(maxWidth: 300)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    
                    
                }
                Text("Then £4.99/month. Cancel at anytime.")
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            .padding(.bottom, 50)
        }
        .fullScreenCover(isPresented: $openNextView){
            //TODO: Replace with StoreKit Trial Payment View
        }
    }
}

#Preview {
    WelcomeView()
}
