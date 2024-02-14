//
//  PokemonListItem.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation

struct PokemonListItem: Codable, Identifiable, Equatable {
    var id: Int {
            guard let urlComponents = URLComponents(string: url),
                  let idString = urlComponents.path.split(separator: "/").last,
                  let id = Int(idString) else {
                return 0
            }
            return id
        }
    var name: String
    var url: String
}
