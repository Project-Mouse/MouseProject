//
//  DetailRunView.swift
//  MouseProject
//
//  Created by Imran razak on 28/05/2024.
//

import SwiftUI

struct DetailRunView: View {
    let run: Run
    
    @State private var isPreviewing = false
    
    var body: some View {
        NavigationStack{
            List{
                ZStack {
                    AsyncImage(url: URL(string: run.runHeaderImage)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .overlay(Color.black.opacity(0.2))
                            
                        case .failure:
                            Rectangle()
                                .background(.blue)
                            // .frame(height: 400)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(height: 350)
                    
                    
                    
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            isPreviewing.toggle()
                        }) {
                            HStack{
                                Image(systemName: "play.fill")
                                Text("Preview")
                                
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        }
                        .padding()
                        .sheet(isPresented: $isPreviewing) {
                            
                        }
                    }
                }
                
                HStack{
                    Spacer()
                    
                    VStack(alignment: .center){
                        //TODO: RunNo Image
                        Text(run.runTitle)
                            .font(.system(size: 35))
                            .bold()
                        
                        Text(run.runSubtitle)
                            .font(.headline)
                        
                    }
                    .padding()
                    
                    Spacer()
                }
                
                Button{
                    
                } label: {
                    Text("Let's Go!")
                        .padding()
                        .frame(width: 350)
                        .bold()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                }
                
                //TODO: Trainer Tip
                
                //TODO: Playlist
                
                
            }
            .listStyle(PlainListStyle())
            .edgesIgnoringSafeArea(.top)
            .preferredColorScheme(.dark)
    
        }
    }
}

#Preview {
    DetailRunView(run: Run(id: "1", runHeaderImage: "https://www.apple.com/v/apple-watch-nike/ag/images/overview/bands_sport_band__c8xg0liytpqq_large_2x.jpg", runTitle: "Test", previewRunUrl: "", runDuration: "", runSubtitle: "", runThumbnail: ""))
}

