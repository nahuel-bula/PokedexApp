//
//  SavedPokemonsScreen.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct SavedPokemonScreen: View {
    @ObservedObject var viewModel = SearchPokemonViewModel()
    var body: some View {
        let savedPokemons = AppManager.shared.savedPokemons
        
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0...AppManager.shared.savedPokemons.count/2, id: \.self) { index in
                    HStack {
                        ForEach(savedPokemons[index*2..<min(index*2 + 2, savedPokemons.count)], id: \.name) { pokemon in
                            SavedPokemonRow(pokemon: pokemon)
                        }
                    }
                }
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            
            Spacer().frame(height: 48)
        }
        .navigationTitle(localized("saved_pokemons_title"))
    }
}

struct SavedPokemonScreen_Previews: PreviewProvider {
    static var previews: some View {
        SavedPokemonScreen()
    }
}
