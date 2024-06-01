//
//  RunView.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI

struct RunView: View {
    let runThumbnail: String
    let runTitle: String
    let runDuration: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: runThumbnail)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .frame(width: 180, height: 160)
                        .cornerRadius(12)
                case .failure(_):
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 180, height: 160)
                        .cornerRadius(10)
                case .empty:
                    ProgressView() // Placeholder while loading
                        .frame(width: 180, height: 160)
                        .cornerRadius(10)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 180, height: 160)
            
            VStack(alignment: .leading) {
                Text(runTitle)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(runDuration)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(.leading)
        .padding(.vertical)
    }
}

// Preview for SwiftUI canvas
#Preview {
    RunView(runThumbnail: "https://www.apple.com/v/apple-fitness-plus/y/images/overview/trainers/hero/trainers_hero__w5qafq0jxrmq_large_2x.jpg", runTitle: "Testing Run", runDuration: "10 mins")
}
