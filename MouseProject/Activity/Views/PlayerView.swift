//
//  PlayerView.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(height: 100)
                .cornerRadius(12)
                .padding()
            HStack{
                Rectangle()
                    .frame(width: 75, height: 75)
                    .foregroundColor(.gray)
                    .cornerRadius(12)
                
                VStack{
                    Text("Test")
                        .foregroundColor(.white)
                        .font(.caption2)
                    Text("Text2")

                }
            }
            
        }
    }
}

#Preview {
    PlayerView()
}
