//
//  PokemonAdditionalInfoView.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct PokemonAdditionalInfoView: View {
    @State private var selectedTabIndex = 0
    var pokemonDetail: PokemonDetail
    var body: some View {
        VStack {
            Picker("", selection: $selectedTabIndex) {
                Text("\(localized("tab_item_about"))").tag(0)
                Text("\(localized("tab_item_stats"))").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 24)
            .padding(.top, 48)
            
            switch selectedTabIndex {
            case 0:
                ScrollView(showsIndicators: false) {
                    VStack {
                        PokemonInfoRow(title: "\(localized("about_height")):", value: "\(Utils.formattedString(from: pokemonDetail.getHeightInCentimeters())) cm")
                        PokemonInfoRow(title: "\(localized("about_weight")):", value: "\(Utils.formattedString(from:pokemonDetail.getWeightInKilograms())) kg")
                        PokemonInfoRow(title: "\(localized("about_species")):", value: "\(pokemonDetail.species.name)")
                        PokemonInfoRow(title: "\(localized("about_abilities")):", value: "\(pokemonDetail.abilities.map({ $0.ability.name }).joined(separator: ", "))")
                    }
                    .padding(.horizontal, 48)
                    .padding(.vertical, 24)
                }
            case 1:
                ScrollView(showsIndicators: false) {
                    StatsViewGroup(stats: pokemonDetail.stats)
                        .padding(.vertical, 24)
                    Spacer().frame(height: 48)
                }
            default:
                EmptyView()
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .background(.white)
        .cornerRadius(24)
    }
}
