//
//  ApiDecoder.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation

class ApiDecoder: JSONDecoder {

    override init() {
        super.init()
        
        keyDecodingStrategy = .custom { keys in
            let lastKey = keys.last?.stringValue ?? ""
            let camelCaseKey = lastKey.replacingOccurrences(of: "-", with: "_").components(separatedBy: "_").enumerated().map { index, component in
                index == 0 ? component : component.capitalized
            }.joined()
            return CustomCodingKey(stringValue: camelCaseKey)!
        }
    }
}
