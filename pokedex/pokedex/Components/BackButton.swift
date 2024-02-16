//
//  BackButton.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode
    var color: Color = .black
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(uiImage: UIImage(named: "backArrow") ?? UIImage())
                .resizable()
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(color)
        }
    }
}
