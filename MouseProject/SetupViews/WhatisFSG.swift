//
//  ContentView.swift
//  MouseProject
//
//  Created by Imran razak on 20/05/2024.
//

import SwiftUI

struct WhatisFSG: View {
    @State private var showPersonalView: Bool = false
    var body: some View {
        NavigationStack{
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
            
            Button(action: {
                        showPersonalView.toggle()
                    }) {
                        Text("Next")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .fullScreenCover(isPresented: $showPersonalView) {
                        PersonalDetails()
                    }
            
        }
    }
}

#Preview {
    WhatisFSG()
}
