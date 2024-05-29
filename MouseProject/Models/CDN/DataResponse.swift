//
//  DataResponse.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import Foundation

struct DataResponse: Codable {
    let data: [response]
}

struct response: Codable{
    let goals: [Goals]
}

struct Goals: Codable{
    let id: String
    let goalNumber: Int
    let artwork: String
    let title: String
    let plans: [Plans]
}


struct Plans: Codable{
    let id: String
    let headerImage: String
    let topText: String
    let title: String
    let duration: Int
}

