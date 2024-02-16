//
//  HomeScreen.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct HomeScreen: View {
    @State private var offsetX: CGFloat = -UIScreen.main.bounds.width/2
    @State private var isAnimating: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image(uiImage: UIImage(named: "landscape") ?? UIImage()).resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .offset(x: offsetX)
                    .onAppear {
                        withAnimation(Animation.linear(duration: 20).repeatForever(autoreverses: true)) {
                            offsetX = UIScreen.main.bounds.width / 2
                        }
                    }
                VStack {
                    Spacer().frame(height: UIScreen.main.bounds.height / 6)
                    Image(uiImage: UIImage(named: "pokemonLogo") ?? UIImage()).resizable()
                        .scaledToFit()
                        .padding(.horizontal, 24)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .scaleEffect(isAnimating ? 1.1 : 1)
                        .onAppear {                            withAnimation(Animation.interpolatingSpring(stiffness: 90, damping: 3).repeatForever(autoreverses: true)
                            .speed(1), {
                                isAnimating = true
                            })
                        }
                        .onDisappear {
                            withAnimation {
                                isAnimating = false
                            }
                        }
                    Spacer()
                    
                    NavigationLink(value: ScreenRouter.searchPokemonsScreen) {
                        Text(localized("search_pokemons"))
                            .frame(maxWidth: .infinity)
                            .font(.custom("SwaggerBold", size: 40, relativeTo: .body))
                            .shadow(color: .black,radius: 1)
                            .foregroundColor(Color.white)
                            .padding()
                    }
                    
                    NavigationLink(value: ScreenRouter.savedPokemonsScreen) {
                        Text(localized("saved_pokemons"))
                            .frame(maxWidth: .infinity)
                            .font(.custom("SwaggerBold", size: 40, relativeTo: .body))
                            .shadow(color: .black,radius: 1)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer().frame(height: 48)
                }
                
                .padding(.horizontal, 24)
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
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
