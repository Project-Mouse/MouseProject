//
//  GetStarted.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI

struct GetStarted: View {
    var body: some View {
        
        Spacer()
        
        
        VStack(alignment: .leading){
            Text("Welcome to Feel Good Training")
                .font(.title)
                .bold()
            Text("Feel Good, don't just look it.")
                .foregroundColor(.blue)
                .bold()
            
        }
        
        Spacer()
        
        HStack{
            Button{
                
            }label: {
                Text("Get Started")
                    .frame(maxWidth: 300)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    GetStarted()
}
