//
//  TrainingPlan.swift
//  MouseProject
//
//  Created by Imran razak on 31/05/2024.
//

import Foundation
import SwiftData


@Model
class TrainingPlan {
    var selectedGoal: String
    var planIdentifier: Int
    var startDate: Date
    
    init(selectedGoal: String, planIdentifier: Int, startDate: Date) {
        self.selectedGoal = selectedGoal
        self.planIdentifier = planIdentifier
        self.startDate = startDate
    }
}
