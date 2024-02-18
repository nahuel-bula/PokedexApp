//
//  MockPokemonApi.swift
//  Pokedex_Tests
//
//  Created by Nahuel Bula on 17/2/24.
//

import Foundation
import Combine
@testable import Pokedex

class MockPokemonApiClient: ApiClientProtocol {
    let mockData: Data
    let mockError: Error?
    
    init(mockData: Data, mockError: Error? = nil) {
        self.mockData = mockData
        self.mockError = mockError
    }
    
    func getPokemons(for url: URL) -> AnyPublisher<Pokedex.PokemonListResponse, Error> {
        let publisher = Result<PokemonListResponse, Error> {
            if let error = self.mockError {
                throw error
            }
            do {
                let decoder = ApiDecoder()
                let pokemonListResponse = try decoder.decode(PokemonListResponse.self, from: mockData)
                return pokemonListResponse
            } catch {
                
                fatalError("Error decoding PokemonListResponse: \(error)")
            }
        }
            .publisher
            .eraseToAnyPublisher()
        
        return publisher
    }
    
    func getPokemonDetails(for url: URL) -> AnyPublisher<Pokedex.PokemonDetail, Error> {
        let publisher = Result<PokemonDetail, Error> {
            if let error = self.mockError {
                throw error
            }
            do {
                let decoder = ApiDecoder()
                let pokemonDetail = try decoder.decode(PokemonDetail.self, from: mockData)
                return pokemonDetail
            } catch {
                
                fatalError("Error decoding PokemonDetail: \(error)")
            }
        }
            .publisher
            .eraseToAnyPublisher()
        
        return publisher
    }
}

