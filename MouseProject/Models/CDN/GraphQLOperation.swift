//
//  GraphQLOperation.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import Foundation


//Goals and PlanPreviews
extension GraphQLOperation {
    static var LIST_GOALS: Self {
        GraphQLOperation(
            """
            {
              goals {
                id
                goalName
                goalImage
                planPreviews {
                  id
                  planIdentifier
                  planName
                  previewImage
                  planPreviewVideo
                  planDuration
                }
              }
            }
            """
        )
    }
}



//Plans
extension GraphQLOperation {
    static var LIST_PLANS: Self {
        GraphQLOperation(
            """
            {
                plans {
                    id
                    planIdentifier
                    weeklyPlans {
                        id
                        weekNumber
                        weekTitle
                        weeklyHeaderImage
                        weekPreviewUrl
                        weekRuns {
                            id
                            runHeaderImage
                            runTitle
                            previewRunUrl
                            runDuration
                            runSubtitle
                            runThumbnail
                        }
                    }
                }
            }
            """
        )
    }
}

