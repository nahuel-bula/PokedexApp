//
//  AsyncImageView.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import SwiftUI

struct AsyncImageView: View {
    @StateObject private var imageLoader: ImageLoader
    private let placeholderImage = UIImage(systemName: "photo")
    
    init(url: String) {
        print(url)
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        if let uiImage = imageLoader.image {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(uiImage: placeholderImage!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onAppear {
                    imageLoader.loadImage()
                }
        }
    }
}
