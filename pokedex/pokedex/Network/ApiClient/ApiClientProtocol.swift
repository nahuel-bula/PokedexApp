//
//  ApiClientProtocol.swift
//  Pokedex
//
//  Created by Nahuel Bula on 17/2/24.
//

import Foundation
import Combine

protocol ApiClientProtocol {
    func getPokemons(for url: URL) -> AnyPublisher<PokemonListResponse, Error>
    func getPokemonDetails(for url: URL) -> AnyPublisher<PokemonDetail, Error>
}
