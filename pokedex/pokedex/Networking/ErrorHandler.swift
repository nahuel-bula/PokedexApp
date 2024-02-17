//
//  ErrorHandler.swift
//  Pokedex
//
//  Created by Nahuel Bula on 17/2/24.
//

import Foundation

struct ErrorHandler {
    static func handle(_ error: Error) {
        NotificationCenter.default.post(name: .errorOccurred, object: error)
    }
}

extension Notification.Name {
    static let errorOccurred = Notification.Name("ErrorOccurred")
}
