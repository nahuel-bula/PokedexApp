//
//  Color+Pokedex.swift
//  Pokedex
//
//  Created by Nahuel Bula on 15/2/24.
//

import Foundation
import SwiftUI

extension Color {
    var isDarkColor: Bool {
        // Check if the luminance is below a threshold
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        let luminance = (0.2126 * red) + (0.7152 * green) + (0.0722 * blue)
        return luminance < 0.5
    }
}
