//
//  App.swift
//  Pokedex
//
//  Created by Nahuel Bula on 14/2/24.
//

import Foundation

class AppManager {
    static let shared = AppManager()
    
    var savedPokemons: [SavedPokemon] {
        didSet{
            UserDefaults.standard.setStructArray(savedPokemons, forKey: Constants.UserDefaults.savedPokemons)
        }
    }
    
    private init() {
        savedPokemons = UserDefaults.standard.structArrayData(SavedPokemon.self, forKey: Constants.UserDefaults.savedPokemons)
    }
}
