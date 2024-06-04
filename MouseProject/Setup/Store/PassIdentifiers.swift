//
//  PassIdentifiers.swift
//  MouseProject
//
//  Created by Imran razak on 04/06/2024.
//

/*
Abstract:
Identifiers for use in the store.
*/

import SwiftUI

public struct PassIdentifiers: Sendable {
    public var group: String
    
    public var individual: String

}

public extension EnvironmentValues {
    
    private enum PassIDsKey: EnvironmentKey {
        static var defaultValue = PassIdentifiers(
            group: "C5405979",
            individual: "SingleSubscription"

        )
    }
    
    var passIDs: PassIdentifiers {
        get { self[PassIDsKey.self] }
        set { self[PassIDsKey.self] = newValue }
    }
    
}
