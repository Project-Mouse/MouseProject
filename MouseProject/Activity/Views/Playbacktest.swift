//
//  Playbacktest.swift
//  MouseProject
//
//  Created by Imran razak on 03/06/2024.
//

import SwiftUI

struct Playbacktest: View {
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading){
                Text("Hello")
                    .font(.title2.bold())
                
                Text("Name")
            }
            Spacer()
        }
        .padding()
       Image(systemName: "play.fill")
            .font(.system(size: 50))
    }
}

#Preview {
    Playbacktest()
}
