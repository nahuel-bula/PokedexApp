//
//  Utils.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation

struct Utils {
    static func formattedString(from floatValue: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0 // Show at least 0 decimal digits
        formatter.maximumFractionDigits = floatValue.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 6 // Show up to 6 decimal digits if necessary
        return formatter.string(from: NSNumber(value: floatValue)) ?? "\(floatValue)"
    }
}
