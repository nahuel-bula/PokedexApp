//
//  StatsViewGroup.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct StatsViewGroup: View {
    var stats: [Stat]
    var body: some View {
        VStack(alignment: .leading, spacing: 4)  {
            ForEach(stats, id: \.stat.name) { stat in
                let statColor: Color = stat.baseStat < 60 ? .green : stat.baseStat < 75 ? .yellow : .red
                StatView(statValue: CGFloat(stat.baseStat), statName: stat.stat.name, statColor: statColor )
            }
        }
    }
}

struct StatsViewGroup_Previews: PreviewProvider {
    static var previews: some View {
        StatsViewGroup(stats: [Stat(baseStat: 55, effort: 0, stat: StatDetail(name: "Attack")), Stat(baseStat: 74, effort: 0, stat: StatDetail(name: "Special-Attack")), Stat(baseStat: 100, effort: 0, stat: StatDetail(name: "Defense"))])
    }
}
