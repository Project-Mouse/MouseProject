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
    var planName: String
    
    init(selectedGoal: String, planName: String) {
        self.selectedGoal = selectedGoal
        self.planName = planName
    }
}
