//
//  Utils.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct Utils {
    static func formattedString(from floatValue: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = floatValue.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 6 // Show up to 6 decimal digits if necessary
        return formatter.string(from: NSNumber(value: floatValue)) ?? "\(floatValue)"
    }
    
    static func sharePokemon(name: String, imageUrl: String) {
        let message = "\(localized("share_pokemon_message_1")) \(name) \(localized("share_pokemon_message_2")): \(imageUrl)"

        let activityViewController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        
        // Present the share sheet
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController?.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
}
