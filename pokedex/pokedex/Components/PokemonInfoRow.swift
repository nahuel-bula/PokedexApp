//
//  PokemonInfoRow.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct PokemonInfoRow: View {
    var title: String
    var value: String
    var body: some View {
        HStack {
            Text("\(title)")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .lineLimit(1)
                .frame(width: 80, height: 24, alignment: .leading)
            
            Text("\(value)")
                .font(.system(size: 14))
                .foregroundColor(.black)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
