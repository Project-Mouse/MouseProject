//
//  PersonalDetails.swift
//  MouseProject
//
//  Created by Imran razak on 20/05/2024.
//

import SwiftUI

struct PersonalDetails: View {
    @State private var name: String = ""
    @State private var age: Int = 18
    @State private var gender: String = ""
    @State private var selectedGender: String = "Choose One"
    @State private var height: Double = 0.0
    @State private var weight: Double = 0.0

    let genders = ["Male", "Female", "Non-Binary", "Other"]
    
    var body: some View {
        NavigationStack{
            Form {
                TextField("Name", text: $name)
                
                HStack {
                    Text("Age")
                    Spacer()
                    TextField("", value: $age, formatter: NumberFormatter())
                                      .keyboardType(.numberPad)
                                      .multilineTextAlignment(.trailing)
                }
                
              
                
                Picker("Gender", selection: $selectedGender) {
                    ForEach(genders, id: \.self) {
                        Text($0)
                    }
                }
                
                HStack {
                    Text("Height (cm)")
                    Spacer()
                    TextField("", value: $height, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                        .frame(width: 100)
                }
                
                HStack {
                    Text("Weight (kg)")
                    Spacer()
                    TextField("", value: $weight, formatter: NumberFormatter())
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                        .frame(width: 100)
                }
                
                
            }
            
            //Next View Button
            // Next View Button
                          NavigationLink(destination: Workouts()) {
                              Text("Next")
                                  .font(.headline)
                                  .foregroundColor(.white)
                                  .padding()
                                  .frame(maxWidth: .infinity)
                                  .background(.blue)
                                  .cornerRadius(10)
                                  .padding()
                          }
            .navigationTitle("Personal Details")
        }
        
    }
}
#Preview {
    PersonalDetails()
}
