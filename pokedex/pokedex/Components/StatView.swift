//
//  StatView.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct StatView: View {
    var statValue: CGFloat
    var statName: String
    var statColor: Color
    let statWidth: CGFloat = 150
    var body: some View {
        
        HStack {
            Text(statName)
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .lineLimit(2)
                .frame(width: 70, alignment: .leading)
            
            Text("\(Utils.formattedString(from:statValue))")
                .font(.system(size: 14, weight: .bold))
                .frame(width: 28, alignment: .leading)
                .lineLimit(1)
            
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.gray.opacity(0.6))
                    .frame(width: statWidth, height: 14)
                
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(statColor)
                    .frame(width: statValue <= 100 ? statWidth * statValue / 100 : statWidth, height: 14)
            }.frame(alignment: .leading)
        }.frame(height: 35)
        
    }
}

struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(statValue: 75, statName: "Attack", statColor: .blue)
    }
}
