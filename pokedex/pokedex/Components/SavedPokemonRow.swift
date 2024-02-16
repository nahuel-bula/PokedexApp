//
//  SavedPokemonRow.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct SavedPokemonRow: View {
    var pokemon: SavedPokemon
    var body: some View {
        let backgroundColor = PokemonTypes(rawValue: pokemon.types.first?.type.name ?? "")?.backgroundColor
        NavigationLink(value: ScreenRouter.pokemonDetailScreen(pokemon.name)) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.teal)
                    .frame(width: 160, height: 200)
                VStack(spacing: 0){
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .cornerRadius(5, corners: [.topLeft, .topRight])
                            .foregroundColor(backgroundColor)
                            .frame(width: 150, height: 150)
                        AsyncImageView(url: pokemon.imageUrl ?? "").frame(width: 100, height: 100)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 0)
                            .cornerRadius(5, corners: [.bottomLeft, .bottomRight])
                            .foregroundColor(.white)
                            .frame(width: 150, height: 40)
                        Text(pokemon.name)
                            .foregroundColor(.black)
                    }
                }
            }
        }.shadow(radius: 2)
        .frame(alignment: .leading)
    }
}

struct SavedPokemonRow_Previews: PreviewProvider {
    static var previews: some View {
        SavedPokemonRow(pokemon: SavedPokemon(name: "bulbasaur", types: [PokemonTypeListItem(type: PokemonType(name: "fire"))], imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"))
    }
}
