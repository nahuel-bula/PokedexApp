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
    @State private var isLoading = true
    
    init(url: String) {
        print(url)
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    var body: some View {
        if let uiImage = imageLoader.image {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(isLoading ? 0 : 1)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isLoading = false
                    }
                }
        } else {
            Image(uiImage: UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onAppear {
                    imageLoader.loadImage()
                }
        }
    }
}
