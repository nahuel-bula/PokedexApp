//
//  Screens.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct SearchPokemonScreen: View {
    @StateObject var viewModel = SearchPokemonViewModel()
    @State private var error: Error?
    
    var body: some View {
        ZStack {
            if !viewModel.loading {
                if !viewModel.pokemons.isEmpty {
                    VStack {
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
                    .onReceive(NotificationCenter.default.publisher(for: .errorOccurred)) { notification in
                        self.error = notification.object as? Error
                    }
                } else {
                    EmptyState()
                        .navigationTitle(localized("search_pokemons_title"))
                        .navigationBarBackButtonHidden(true)
                        .navigationBarItems(leading: BackButton().frame(alignment: .leading))
                }
            } else {
                ProgressView()
                    .navigationTitle(localized("search_pokemons_title"))
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: BackButton().frame(alignment: .leading))
                    .onReceive(NotificationCenter.default.publisher(for: .errorOccurred)) { notification in
                        self.error = notification.object as? Error
                    }
            }
            if let error = error {
                ErrorAlert(message: error.localizedDescription) {
                    self.error = nil
                }
                .transition(.slide)
            }
        }
    }
}

struct SearchPokemonScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchPokemonScreen()
    }
}
