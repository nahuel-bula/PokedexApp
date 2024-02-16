//
//  SavedPokemon.swift
//  Pokedex
//
//  Created by Nahuel Bula on 14/2/24.
//

import Foundation

struct SavedPokemon: Codable {
    var name: String
    var types: [PokemonTypeListItem]
    var imageUrl: String?
}
