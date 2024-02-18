//
//  PokemonApiClient.swift
//  Pokedex
//
//  Created by Nahuel Bula on 17/2/24.
//

import Foundation
import Combine

class PokemonApiClient: ApiClientProtocol {
    func getPokemons(for url: URL) -> AnyPublisher<PokemonListResponse, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                
                switch httpResponse.statusCode {
                case 200...299:
                    return data
                default:
                    throw ApiError(rawValue: httpResponse.statusCode) ?? ApiError.unknown
                }
            }
            .decode(type: PokemonListResponse.self, decoder: ApiDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func getPokemonDetails(for url: URL) -> AnyPublisher<PokemonDetail, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> Data in
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw URLError(.badServerResponse)
                }
                switch httpResponse.statusCode {
                case 200...299:
                    return data
                default:
                    throw ApiError(rawValue: httpResponse.statusCode) ?? ApiError.unknown
                }
            }
            .decode(type: PokemonDetail.self, decoder: ApiDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

