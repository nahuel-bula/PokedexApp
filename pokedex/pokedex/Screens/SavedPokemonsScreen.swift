//
//  SavedPokemonsScreen.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct SavedPokemonScreen: View {
    var body: some View {
        List(AppManager.shared.savedPokemons, id: \.name) { pokemon in
            VStack {
                AsyncImageView(url: pokemon.imageUrl ?? "").frame(width: 50, height: 50)
                Spacer(minLength: 20)
                Text(pokemon.name)
            }
        }
        .navigationTitle("Saved Pokemons")
    }
}

struct SavedPokemonScreen_Previews: PreviewProvider {
    static var previews: some View {
        SavedPokemonScreen()
    }
}
