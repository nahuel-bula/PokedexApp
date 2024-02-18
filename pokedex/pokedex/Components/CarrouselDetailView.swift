//
//  CarrouselDetailView.swift
//  Pokedex
//
//  Created by Nahuel Bula on 18/2/24.
//

import Foundation
import SwiftUI

struct CarrouselDetailView: View {
    let imageUrl: String
    let onClose: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                AsyncImageView(url: imageUrl)
                    .frame(width: 300, height: 300)
                Spacer()
                Text(localized("tap_to_exit"))
                    .font(.custom("SwaggerLight", size: 26, relativeTo: .body))
                    .foregroundColor(Color.white)
                Spacer()
            }
        }
        .onTapGesture {
            onClose()
        }
    }
}
