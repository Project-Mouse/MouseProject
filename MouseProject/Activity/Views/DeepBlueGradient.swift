//
//  DeepBlueGradient.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//

import SwiftUI

struct DeepBlueGradient: View {
    var body: some View {
        LinearGradient(
                 gradient: Gradient(colors: [Color("DeepBlue"), Color("Deep Blue DARK")]),
                 startPoint: .top,
                 endPoint: .bottom
             )
             .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    DeepBlueGradient()
}
