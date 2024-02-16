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
                        PokemonRowView(pokemonName: pokemon.name.capitalized)
                            .onAppear {
                                if self.viewModel.pokemons.last == pokemon {
                                    self.viewModel.fetchPokemons()
                                }
                            }
                    }
                    Spacer().frame(height: 30)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
            }
            .background(Color.gray.opacity(0.1))
        }
        .navigationTitle(localized("search_pokemons_title"))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: BackButton().frame(alignment: .leading))
    }
}

struct SearchPokemonScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchPokemonScreen()
    }
}
