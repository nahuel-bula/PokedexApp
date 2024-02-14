//
//  ScreenRouter.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

enum ScreenRouter: Hashable {
    case searchPokemonsScreen
    case savedPokemonsScreen
    case pokemonDetailScreen(String)
}
