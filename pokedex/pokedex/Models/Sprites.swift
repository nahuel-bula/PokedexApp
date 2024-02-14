//
//  Sprites.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation

struct Sprites: Codable {
    var frontDefault: String?
    var frontFemale: String?
    var frontShiny: String?
    var frontShinyFemale: String?
    var backDefault: String?
    var backFemale: String?
    var backShiny: String?
    var backShinyFemale: String?
    var other: OtherSprites
    
    func allSprites() -> [String] {
        var spriteURLs: [String] = []
        if let frontDefault = frontDefault {
            spriteURLs.append(frontDefault)
        }
        if let frontFemale = frontFemale {
            spriteURLs.append(frontFemale)
        }
        if let frontShiny = frontShiny {
            spriteURLs.append(frontShiny)
        }
        if let frontShinyFemale = frontShinyFemale {
            spriteURLs.append(frontShinyFemale)
        }
        if let backDefault = backDefault {
            spriteURLs.append(backDefault)
        }
        if let backFemale = backFemale {
            spriteURLs.append(backFemale)
        }
        if let backShiny = backShiny {
            spriteURLs.append(backShiny)
        }
        if let backShinyFemale = backShinyFemale {
            spriteURLs.append(backShinyFemale)
        }
        // Other sprites
        spriteURLs.append(contentsOf: other.home.allSprites())
        spriteURLs.append(contentsOf: other.officialArtwork.allSprites())
        spriteURLs.append(contentsOf: other.showdown.allSprites())
        return spriteURLs
    }
}
