//
//  DataResponse.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import Foundation

struct GoalsDataResponse: Codable {
    let data: DataResponse
}

struct DataResponse: Codable {
    let goals: [Goals]
}

struct Goals: Codable, Identifiable, Hashable {
    let id = UUID().uuidString
    let goalNumber: Int
    let artwork: String
    let title: String
    let plans: [Plans]

    // Conformance to Hashable
    static func == (lhs: Goals, rhs: Goals) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct Plans: Codable, Identifiable, Hashable {
    let id: String
    let headerImage: String
    let topText: String
    let title: String
    let duration: Int
    
    let weeklyPreview: [WeeklyPreview]

    // Conformance to Hashable
    static func == (lhs: Plans, rhs: Plans) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}


struct WeeklyPreview: Codable, Identifiable {
    let id: String
    let weekNo: Int
    let previewUrl: String
    let headerImage: String

    enum CodingKeys: String, CodingKey {
        case id, weekNo, previewUrl, headerImage
    }
}
