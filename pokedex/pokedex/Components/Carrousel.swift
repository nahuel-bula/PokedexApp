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
    @State private var selectedImage: IdentifiableString?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 40) {
                ForEach(spriteUrls, id: \.self) { spriteUrl in
                    Button(action: {
                        selectedImage = IdentifiableString(value: spriteUrl)
                    }) {
                        AsyncImageView(url: spriteUrl)
                            .frame(width: 150, height: 150)
                    }
                }
            }
            .frame(height: 150)
        }
        .fullScreenCover(item: $selectedImage) { imageUrl in
            if let index = spriteUrls.firstIndex(of: imageUrl.value) {
                CarrouselDetailView(imageUrl: imageUrl.value, onClose: {
                    selectedImage = nil
                })
            }
        }
    }
}
