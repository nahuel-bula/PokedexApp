//
//  PokemonTypesCollection.swift
//  Pokedex
//
//  Created by Nahuel Bula on 15/2/24.
//

import Foundation
import SwiftUI

struct PokemonTypesCollection: View {
    var pokemonTypes: [PokemonTypeListItem]
    var textColor: Color = .black
    var body: some View {
        HStack(spacing: 8) {
            ForEach(pokemonTypes, id: \.type.name) { type in
                Text(type.type.name)
                    .font(.custom("Swagger", size: 18, relativeTo: .title))
                    .foregroundColor(textColor)
                    .lineLimit(1)
                    .frame(height: 32)
                    .padding(.horizontal, 10)
                    .background(.white.opacity(0.3))
                    .cornerRadius(16)
            }
            
            Spacer()
        }
    }
}
