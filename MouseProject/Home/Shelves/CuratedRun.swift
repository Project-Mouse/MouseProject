//
//  CuratedRun.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI

struct CuratedRun: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("Yoga") // Replace with your image name
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(12)
            
            Text("Cry")
                .font(.headline)
                .fontWeight(.bold)
                .padding(.top, 8)
            
            Text("Benson Boone")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 150)
    }
}

#Preview {
    CuratedRun()
}
