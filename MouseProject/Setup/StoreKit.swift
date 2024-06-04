//
//  StoreKit.swift
//  MouseProject
//
//  Created by Imran razak on 04/06/2024.
//

import SwiftUI
import StoreKit


struct StoreKit: View {
    @Environment(\.passIDs.group) private var passGroupID
    var body: some View {
        SubscriptionStoreView(groupID: passGroupID)
    }
}

#Preview {
    StoreKit()
}
