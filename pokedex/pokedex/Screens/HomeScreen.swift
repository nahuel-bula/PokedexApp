//
//  HomeScreen.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                NavigationLink(value: ScreenRouter.searchPokemonsScreen) {
                    Text("Search Pokémons")
                        .frame(maxWidth: .infinity)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                NavigationLink(value: ScreenRouter.savedPokemonsScreen) {
                    Text("Saved Pokémons")
                        .frame(maxWidth: .infinity)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)

                }
                Spacer().frame(height: 48)
            }
            .navigationTitle("Pokedex")
            .navigationDestination(for: ScreenRouter.self) { route in
                switch route {
                case .searchPokemonsScreen :
                    SearchPokemonScreen()
                case .savedPokemonsScreen :
                    SavedPokemonScreen()
                case .pokemonDetailScreen(let pokemonName):
                    PokemonDetailScreen(pokemonName: pokemonName)
                }
            }
        }.padding(.horizontal, 24)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
