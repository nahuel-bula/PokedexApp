//
//  Utils.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct Utils {
    //Format Double numbers as string to show between 0 and 6 fraction digits
    static func formattedString(from floatValue: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = floatValue.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 6
        return formatter.string(from: NSNumber(value: floatValue)) ?? "\(floatValue)"
    }
    
    //Share the pokemon using activity viewController
    static func sharePokemon(name: String, imageUrl: String) {
        let message = "\(localized("share_pokemon_message_1")) \(name) \(localized("share_pokemon_message_2")): \(imageUrl)"

        let activityViewController = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let window = windowScene.windows.first {
                window.rootViewController?.present(activityViewController, animated: true, completion: nil)
            }
        }
    }
}
