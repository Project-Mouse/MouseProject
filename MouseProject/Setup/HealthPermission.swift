//
//  PermissionsView.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import SwiftUI

struct HealthPermission: View {
    @StateObject private var healthKitManager = StepCountViewModel()
    
    var body: some View {
        VStack {
            Text("Permissions")
            
            Button(action: {
                healthKitManager.requestAuthorization() // Call instance method
            }) {
                Text("Request Health Permissions")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    HealthPermission()
}
