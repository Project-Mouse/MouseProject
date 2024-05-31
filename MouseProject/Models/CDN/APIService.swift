//
//  APIService.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import Foundation

class APIService {
    let api: GraphQLAPI = GraphQLAPI()
   
    func listGoals() async throws -> [Goals] {
        do {
            let dataResponse: DataResponse = try await self.api.performOperation(GraphQLOperation.LIST_GOALS)
            return dataResponse.goals
            
        } catch {
            print("Error fetching data:", error.localizedDescription)
            throw NSError(domain: "APIService", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch data"])
        }
    }
     
}
