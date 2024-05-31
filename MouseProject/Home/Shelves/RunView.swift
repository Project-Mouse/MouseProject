//
//  RunView.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI

struct RunView: View {
    let imageName: String
    let title: String
    let duration: String
    
    var body: some View {
        HStack {
                if let uiImage = UIImage(named: imageName) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .frame(width: 180, height: 160)
                        .cornerRadius(10)
                } else {
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 80, height: 80)
                        .cornerRadius(10)
                }
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(duration)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
      
        }
        .padding(.leading)
        
        
        //.padding(.vertical)
        .padding(.leading)
    }
}

#Preview {
    RunView(imageName: "Run", title: "Testing Run", duration: "10 mins")
}
