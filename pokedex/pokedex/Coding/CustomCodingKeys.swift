//
//  CustomCodingKeys.swift
//  Pokedex
//
//  Created by Nahuel Bula on 14/2/24.
//

import Foundation

struct CustomCodingKey: CodingKey {
    var stringValue: String
    
    init?(stringValue: String) {
        self.stringValue = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    init?(intValue: Int) {
        return nil
    }
}
