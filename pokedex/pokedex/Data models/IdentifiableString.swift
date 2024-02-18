//
//  IdentifiableString.swift
//  Pokedex
//
//  Created by Nahuel Bula on 18/2/24.
//

import Foundation

struct IdentifiableString: Identifiable {
    let id = UUID()
    let value: String
}
