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
    @State private var isFavorite: Bool = false
    
    var pokemonName: String
    
    var body: some View {
        if let pokemonDetail = viewModel.pokemonDetail {
            let backgroundColor = PokemonTypes(rawValue: pokemonDetail.types.first?.type.name ?? "")?.backgroundColor ?? PokemonTypes.unknown.backgroundColor
            let itemsColor: Color = backgroundColor.isDarkColor ? .white : .black
            GeometryReader { geometry in
                VStack {
                    ZStack {
                        Image(uiImage: UIImage(named: "pokeballBackground") ?? UIImage())
                            .resizable()
                            .frame(width: 600, height: 600, alignment: .bottomTrailing)
                            .padding(.trailing, -200)
                            .foregroundColor(.white.opacity(0.1))
                        
                        VStack {
                            Text(pokemonDetail.name.capitalized)
                                .font(.custom("SwaggerBold", size: 46, relativeTo: .title))
                                .foregroundColor(itemsColor)
                                .lineLimit(1)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 24)
                            
                            PokemonTypesCollection(pokemonTypes: pokemonDetail.types, textColor: itemsColor).padding(.horizontal, 24)
                            
                            Carrousel(spriteUrls: pokemonDetail.sprites.allSprites())
                        }
                    }.frame(height: 280)
                    
                    PokemonAdditionalInfoView(pokemonDetail: pokemonDetail)
                }
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .background(backgroundColor)
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButton(color: itemsColor).frame(alignment: .leading),
                                trailing: HStack{
                Button(action: {
                    Utils.sharePokemon(name: pokemonDetail.name.capitalized, imageUrl: pokemonDetail.portraitPicture)
                }) {
                    Image(uiImage: UIImage(named: "share") ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(itemsColor)
                }
                .onAppear {
                    isFavorite = viewModel.isFavorite()
                }
                
                Button(action: {
                    viewModel.updateFavorite()
                    isFavorite.toggle()
                }) {
                    Image(uiImage: UIImage(named: isFavorite ? "favoriteFilled" : "favoriteEmpty") ?? UIImage())
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24)
                        .foregroundColor(itemsColor)
                }
                .onAppear {
                    isFavorite = viewModel.isFavorite()
                }
            })
        } else {
            ProgressView()
                .onAppear {
                    viewModel.fetchPokemonDetail(name: pokemonName)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: BackButton().frame(alignment: .leading))
        }
    }
}


struct PokemonDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailScreen(pokemonName: "pikachu")
    }
}
