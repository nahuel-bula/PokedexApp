//
//  Stat.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation

struct Stat: Codable {
    var baseStat: Int
    var effort: Int
    var stat: StatDetail
}
