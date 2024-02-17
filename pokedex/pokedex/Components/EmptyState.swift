//
//  EmptyState.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct EmptyState: View {
    var body: some View {
        VStack(spacing: 4) {
            ZStack{
                Image(uiImage: UIImage(named: "pikachuDetective") ?? UIImage())
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300, alignment: .bottomTrailing)
                Text("Oops!")
                    .font(.system(size: 70, weight: .medium))
                    .offset(x: -70, y: -110)
            }
            Text(localized("empty_state_message"))
                .font(.system(size: 30))
                .foregroundColor(.black)
                .padding(24)
                
        }
    }
}

struct EmptyState_Previews: PreviewProvider {
    static var previews: some View {
        EmptyState()
    }
}
