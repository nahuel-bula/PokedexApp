//
//  ApiEncoder.swift
//  Pokedex
//
//  Created by Nahuel Bula on 14/2/24.
//

import Foundation

class ApiEncoder: JSONEncoder {

    override init() {
        super.init()

        keyEncodingStrategy = .custom { keys in
            let lastKey = keys.last?.stringValue ?? ""
            let camelCaseKey = lastKey.replacingOccurrences(of: "-", with: "_").components(separatedBy: "_").enumerated().map { index, component in
                index == 0 ? component : component.capitalized
            }.joined()
            return CustomCodingKey(stringValue: camelCaseKey)!
        }
    }
}
