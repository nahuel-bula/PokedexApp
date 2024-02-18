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
    @State private var isShaking = false
    
    let randomDelay = Double.random(in: 1...2)
    let randomDuration = Double.random(in: 0.1...0.4)
    
    func randomShakesNumber() -> Int {
        var randomNumber = Int.random(in: 3...15)
        if randomNumber % 2 == 0 {
            randomNumber += 1
        }
        return randomNumber
    }
    
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
                    .rotationEffect(.degrees(isShaking ? 5 : 0))
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: randomDuration)
                            .repeatCount(randomShakesNumber())
                            .delay(randomDelay)
                            .repeatForever(autoreverses: true)) {
                                isShaking.toggle()
                            }
                    }
                
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
