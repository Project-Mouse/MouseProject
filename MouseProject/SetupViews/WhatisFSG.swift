//
//  ContentView.swift
//  MouseProject
//
//  Created by Imran razak on 20/05/2024.
//

import SwiftUI

struct WhatisFSG: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("We're all about feeling good about Fitness.")
                .font(.title)
                .bold()
                .foregroundColor(.green)
            Text("Everyone get's a Feel Good Score, which is the only metric you need to care about.")
                .padding(.bottom)
            
            Text("We take into account your Age, Gender, Height and Weight to determine a score, which changes based on your workouts. That means you can rest and still get rewarded too.")
        }
        .padding()
        
        Button {
            
        }label: {
            Text("Next")
        }
        
    }
}

#Preview {
    WhatisFSG()
}
