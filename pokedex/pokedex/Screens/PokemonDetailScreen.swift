//
//  PokemonDetailScreen.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct PokemonDetailScreen: View {
    @ObservedObject var viewModel = PokemonDetailViewModel()
    var pokemonName: String
    
    var body: some View {
        if let pokemonDetail = viewModel.pokemonDetail {
            VStack {
                Text("Name: \(pokemonDetail.name)")
                Text("Height: \(pokemonDetail.getHeightInCentimeters()) cm")
                Text("Weight: \(pokemonDetail.getWeightInKilograms()) kg")
                Text("Species: \(pokemonDetail.species.name)")
                Text("Abilities:")
                ForEach(pokemonDetail.abilities, id: \.ability.name) { ability in
                    Text(ability.ability.name)
                }
                Text("Stats:")
                ForEach(pokemonDetail.stats, id: \.stat.name) { stat in
                    Text("\(stat.stat.name): \(stat.baseStat)")
                }
                Text("Types:")
                ForEach(pokemonDetail.types, id: \.type.name) { type in
                    Text(type.type.name)
                }
            }
            .padding()
            .navigationTitle("Pokemon Detail")
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(pokemonDetail.sprites.allSprites(), id: \.self) { spriteUrl in
                        AsyncImageView(url: spriteUrl)
                            .frame(width: 100, height: 100)
                    }
                }
            }
        } else {
            ProgressView()
                .onAppear {
                    viewModel.fetchPokemonDetail(name: pokemonName)
                }
        }
    }
}

struct PokemonDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailScreen(pokemonName: "pikachu")
    }
}
