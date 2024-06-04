//
//  ElapsedTime.swift
//  MouseProjectWatch Watch App
//
//  Created by Imran razak on 04/06/2024.
//
/*

Abstract:
A SwiftUI view that shows the elapsed time.
*/

import SwiftUI

struct ElapsedTimeView: View {
    var elapsedTime: TimeInterval = 0
    var showSubseconds = true
    @State private var timeFormatter = ElapsedTimeFormatter()

    var body: some View {
        VStack {
            Text("⏱️")
                .font(.system(size: 30))
            Text(NSNumber(value: elapsedTime), formatter: timeFormatter)
                .fontWeight(.semibold)
        }
        .onChange(of: showSubseconds) { (oldValue, newValue) in
            timeFormatter.showSubseconds = newValue
        }
    }
}

class ElapsedTimeFormatter: Formatter {
    let componentsFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    var showSubseconds = true

    override func string(for value: Any?) -> String? {
        guard let time = value as? TimeInterval else {
            return nil
        }

        guard let formattedString = componentsFormatter.string(from: time) else {
            return nil
        }

        if showSubseconds {
            let hundredths = Int((time.truncatingRemainder(dividingBy: 1)) * 100)
            let decimalSeparator = Locale.current.decimalSeparator ?? "."
            return String(format: "%@%@%0.2d", formattedString, decimalSeparator, hundredths)
        }

        return formattedString
    }
}
