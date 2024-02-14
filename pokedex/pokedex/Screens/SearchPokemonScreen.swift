//
//  Screens.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct SearchPokemonScreen: View {
    @ObservedObject var viewModel = SearchPokemonViewModel()
    var body: some View {
            List {
                ForEach(viewModel.pokemons) { pokemon in
                    VStack {
                        NavigationLink(value: ScreenRouter.pokemonDetailScreen(pokemon.name)) {
                            Text(pokemon.name)
                            .padding()
                            .onAppear {
                                if self.viewModel.pokemons.last == pokemon {
                                    self.viewModel.fetchPokemons()
                                }
                            }
                        }
                    }
                }
        }
        .navigationTitle("Search Pokémon")
    }
}

struct SearchPokemonScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchPokemonScreen()
    }
}
