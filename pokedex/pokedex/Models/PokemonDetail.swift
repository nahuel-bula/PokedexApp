//
//  PokemonDetail.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation

struct PokemonDetail: Codable, Equatable {
    static func == (lhs: PokemonDetail, rhs: PokemonDetail) -> Bool {
        return lhs.name == rhs.name
    }
    
    var abilities: [AbilityListItem]
    var height: Double
    var name: String
    var species: Species
    var sprites: Sprites
    var stats: [Stat]
    var types: [PokemonTypeListItem]
    var weight: Double
    var portraitPicture: String {
        return sprites.other.officialArtwork.frontDefault ?? ""
    }
    
    func getHeightInCentimeters() -> Double {
        return height * 10
    }
    
    func getWeightInKilograms() -> Double {
        return weight / 10
    }
}
