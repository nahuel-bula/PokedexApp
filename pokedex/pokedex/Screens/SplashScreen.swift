//
//  SplashScreen.swift
//  Pokedex
//
//  Created by Nahuel Bula on 18/2/24.
//

import Foundation
import SwiftUI

struct SplashScreen: View {
    @State var isActive = false
    @State private var spacerHeight: CGFloat = UIScreen.main.bounds.height / 3
    
    var body: some View {
        ZStack {
            if isActive {
                HomeScreen()
            } else {
                VStack {
                    Spacer().frame(height: spacerHeight)
                    Image(uiImage: UIImage(named: "pokemonLogo") ?? UIImage())
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal, 24)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                    Spacer()
                }
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
                withAnimation {
                    spacerHeight = UIScreen.main.bounds.height / 6
                }
            }

        }
    }
}
