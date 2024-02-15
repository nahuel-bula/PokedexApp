//
//  PokemonRowView.swift
//  Pokedex
//
//  Created by Nahuel Bula on 15/2/24.
//

import Foundation
import SwiftUI

struct PokemonRowView: View {
    var pokemonName: String
    var body: some View {
        ZStack {
            Image(uiImage: UIImage(named: "pokeballBackground") ?? UIImage())
                .resizable()
                .frame(width: 300, height: 300)
                .foregroundColor(Color.blue.opacity(0.1))
            HStack {
                Image(uiImage: UIImage(named: "pokeball") ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .leading)
                    .frame(width: 100, height: 100)
                    .padding(.horizontal, 16)
                
                Text(pokemonName)
                    .font(.custom("SwaggerBold", size: 38, relativeTo: .body))
                    .foregroundColor(.black)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
        }.background(Color.white)
            .frame(height: 130)
            .clipped()
            .cornerRadius(10)
        
        
    }
}
