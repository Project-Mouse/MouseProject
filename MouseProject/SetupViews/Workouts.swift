//
//  Workouts.swift
//  MouseProject
//
//  Created by Imran razak on 20/05/2024.
//

import SwiftUI

struct Workouts: View {
    @State private var selectedNumber: Int = 1
    
    var body: some View {
        
        Text("How often do you want to workout?")
            .font(.title)
            .bold()
        
        Text("Selected Number: \(selectedNumber)")
        
        HStack(spacing: 20) {
            ForEach(1..<4) { number in
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(selectedNumber == number ? .green : .gray)
                    .overlay(
                        Text("\(number)")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                    )
                    .onTapGesture {
                        selectedNumber = number
                    }
            
            }
        }
        .padding()
    }
}

#Preview {
    Workouts()
}
