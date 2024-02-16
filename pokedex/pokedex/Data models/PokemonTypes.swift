//
//  PokemonType.swift
//  Pokedex
//
//  Created by Nahuel Bula on 15/2/24.
//

import Foundation
import SwiftUI

enum PokemonTypes: String, CaseIterable {
    case normal, fighting, flying, poison, ground, rock, bug, ghost, steel, fire, water, grass, electric, psychic, ice, dragon, dark, fairy, unknown, shadow
    
    var backgroundColor: Color {
        switch self {
        case .normal: return Color.gray
        case .fighting: return Color.red
        case .flying: return Color.blue
        case .poison: return Color.purple
        case .ground: return Color.orange
        case .rock: return Color(UIColor(red: 0.6, green: 0.4, blue: 0.2, alpha: 1.0))
        case .bug: return Color.green
        case .ghost: return Color.black
        case .steel: return Color(UIColor(red: 0.7, green: 0.7, blue: 0.8, alpha: 1.0))
        case .fire: return Color.orange
        case .water: return Color.blue
        case .grass: return Color.green
        case .electric: return Color.yellow
        case .psychic:  return Color(UIColor(red: 0.8, green: 0.4, blue: 0.8, alpha: 1.0))
        case .ice: return Color.mint
        case .dragon:  return Color(UIColor(red: 0.4, green: 0.2, blue: 0.8, alpha: 1.0))
        case .dark: return Color(UIColor(red: 0.2, green: 0.2, blue: 0.4, alpha: 1.0))
        case .fairy: return Color(UIColor(red: 0.9, green: 0.7, blue: 0.7, alpha: 1.0))
        case .unknown, .shadow: return Color.gray.opacity(0.5)
        }
    }
}
