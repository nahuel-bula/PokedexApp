//
//  PokemonListResponse.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation

struct PokemonListResponse: Codable {
    var results: [PokemonListItem]
}
