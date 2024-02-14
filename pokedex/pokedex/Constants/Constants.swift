//
//  Constants.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation

struct Constants {
    static let pageSize: Int = 20
    struct API {
        static let host: String = "https://pokeapi.co/api/v2"
        struct Keys {
            static let pokemon = "pokemon"
        }
        struct Queries {
            static let limit = "limit"
            static let offset = "offset"
        }
    }
    struct UserDefaults {
        static let pokemonDetailPrefix = "PokemonDetailCache"
        static let savedPokemons = "savedPokemons"
    }
}
