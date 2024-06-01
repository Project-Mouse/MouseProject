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

struct PlansResponse: Codable{
    let data: PlansDataResponse
}

struct DataResponse: Codable {
    let goals: [Goals]
}

struct PlansDataResponse: Codable{
    let plans: [Plans]
}

struct Goals: Codable, Identifiable, Hashable {
    let id = UUID().uuidString
    let goalName: String
    let goalImage: String
    let planPreviews: [PlanPreviews]
   // let plans: [Plans]

    // Conformance to Hashable
    static func == (lhs: Goals, rhs: Goals) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct PlanPreviews: Codable, Identifiable{
    let id: String
    let planIdentifier: Int
    let planName: String
    let previewImage: String
    let planPreviewVideo: String
    let planDuration: Int
    
    
}

struct Plans: Codable, Identifiable, Hashable {
    let id = UUID().uuidString
    let planIdentifier: Int
    let weeklyPlans: [WeeklyPlan]

    // Conformance to Hashable
    static func == (lhs: Plans, rhs: Plans) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct WeeklyPlan: Codable, Identifiable {
    let id: String
    let weekNumber: Int
    let weekTitle: String
    let weeklyHeaderImage: String
    let weekPreviewUrl: String
    let weekRuns: [Run]

    enum CodingKeys: String, CodingKey {
        case id, weekNumber, weekTitle, weeklyHeaderImage, weekPreviewUrl, weekRuns
    }
}

struct Run: Codable, Identifiable {
    let id: String
    let runHeaderImage: String
    let runTitle: String
    let previewRunUrl: String
    let runDuration: String
    let runSubtitle: String
    let runThumbnail: String

    enum CodingKeys: String, CodingKey {
        case id, runHeaderImage, runTitle, previewRunUrl, runDuration, runSubtitle, runThumbnail
    }
}

