//
//  Logger.swift
//  MouseProject
//
//  Created by Imran razak on 04/06/2024.
//

/*
Abstract:
An extension that provides a shared logger.
*/

import Foundation
import os

extension Logger {
    private static var subsystem = Bundle.main.bundleIdentifier!
    #if os(watchOS)
    static let shared = Logger(subsystem: subsystem, category: "MirroringWorkoutsSampleForWatch")
    #else
    static let shared = Logger(subsystem: subsystem, category: "MirroringWorkoutsSample")
    #endif
}
