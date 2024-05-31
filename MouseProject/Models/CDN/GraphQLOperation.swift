//
//  GraphQLOperation.swift
//  MouseProject
//
//  Created by Imran razak on 29/05/2024.
//

import Foundation

extension GraphQLOperation {
    static var LIST_GOALS: Self {
        GraphQLOperation(
            """
            {
              goals {
                id
                goalNumber
                artwork
                title
                plans {
                  id
                  headerImage
                  topText
                  title
                  duration
                  weeklyPreview {
                    id
                    weekNo
                    previewUrl
                    headerImage
                  }
                }
              }
            }
            """
        )
    }
}
