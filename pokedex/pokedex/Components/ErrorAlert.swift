//
//  ErrorAlert.swift
//  Pokedex
//
//  Created by Nahuel Bula on 16/2/24.
//

import Foundation
import SwiftUI

struct ErrorAlert: View {
    let message: String
    let dismissAction: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(message)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.red)
                    .padding(16)
                Button(action: { dismissAction() }) {
                    Text("Close")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 5)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    dismissAction()
                }
            }
            .alignmentGuide(.top) { _ in
                geometry.safeAreaInsets.top
            }
        }
    }
}

struct ErrorAlert_Previews: PreviewProvider {
    static var previews: some View {
        ErrorAlert(message: "Error", dismissAction: {})
    }
}
