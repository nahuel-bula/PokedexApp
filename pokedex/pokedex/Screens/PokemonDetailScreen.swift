//
//  PokemonDetailScreen.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct PokemonDetailScreen: View {
    var pokemonName: String
    
    var body: some View {
        Text(pokemonName)
            .font(.title)
            .padding()
    }
}

struct PokemonDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailScreen(pokemonName: "pikachu")
    }
}
