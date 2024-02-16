//
//  Carrousel.swift
//  Pokedex
//
//  Created by Nahuel Bula on 15/2/24.
//

import Foundation
import SwiftUI

struct Carrousel: View {
    var spriteUrls: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false  ) {
            LazyHStack {
                ForEach(spriteUrls, id: \.self) { spriteUrl in
                    AsyncImageView(url: spriteUrl)
                        .frame(width: 150, height: 150)
                    Spacer().frame(width: 40)
                }
            }.frame(height: 150)
        }
    }
}
