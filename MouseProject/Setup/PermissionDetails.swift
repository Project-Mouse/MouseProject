//
//  PermissionDetails.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import SwiftUI

struct PermissionDetails: View {
    
    @State private var nextView: Bool = false
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        NavigationStack{
            Form{
                VStack(alignment: .leading){
                    Image(systemName: "heart.text.square.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.red)
                        .padding([.top, .bottom], 10)
                    Text("Health App")
                        .font(.headline)
                    
                    Text("We will only read your step count from the Health App to give you Feel Good Points for your everday movement ")
                        .padding(.bottom)
                }
                VStack(alignment: .leading){
                    Image(systemName: "location.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.blue)
                        .padding([.top, .bottom], 10)
                    
                    Text("Location")
                        .font(.headline)
                    
                    Text("We will trace your run route only when you start a run within the app. We also use your current location to show you the Weather so you can plan your run.")
                        .padding(.bottom)
                }
                VStack(alignment: .leading){
                    Image(systemName: "airpodspro")
                        .font(.system(size: 35))
                        .foregroundColor(.blue)
                        .padding([.top, .bottom], 10)
                    
                    Text("Apple Music")
                        .font(.headline)
                    
                    Text("We require permisison to use your Apple Music Service so we can play music we've chosen for the run. If you don't use Apple Music, You can still listen to music from outside the app too.")
                        .padding(.bottom)
                }
                
                
            }
            Divider()
                .padding([.leading, .trailing, .bottom])
            
            Button(action: {
                // Action to perform when the button is tapped
                locationManager.requestAuthorization()
                
            }) {
                Text("Accept")
                    .frame(width: 300, height: 50)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.bottom, 20) // Adjust padding as needed
            }
            .navigationTitle("Permissions")
            .onChange(of: locationManager.authorizationStatus) { status in
                if status == .authorizedWhenInUse || status == .authorizedAlways {
                    nextView.toggle()
                }
            }
            .fullScreenCover(isPresented: $nextView){
                HealthPermissionView()
            }
        }
    }
}

#Preview {
    PermissionDetails()
}
