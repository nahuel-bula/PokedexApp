//
//  PokemonDetailViewModel.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import Combine

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetail?
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchPokemonDetail(name: String) {
        guard let url = URL(string: "\(Constants.API.host)/\(Constants.API.Keys.pokemon)/\(name)") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokemonDetail.self, decoder: ApiDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.pokemonDetail = response
                self?.saveToCache(response, name: name)
            })
            .store(in: &cancellables)
    }
    
    private func loadFromCache(name: String) -> PokemonDetail? {
        if let cachedData = UserDefaults.standard.data(forKey: "\(Constants.Cache.pokemonDetailPrefix)_\(name)"),
           let cachedDetail = try? JSONDecoder().decode(PokemonDetail.self, from: cachedData) {
            return cachedDetail
        }
        return nil
    }
    
    private func saveToCache(_ detail: PokemonDetail, name: String) {
        if let encoded = try? JSONEncoder().encode(detail) {
            UserDefaults.standard.set(encoded, forKey: cacheKey(for: name))
        }
    }
    
    private func cacheKey(for name: String) -> String {
        return "\(Constants.Cache.pokemonDetailPrefix)_\(name)"
    }
}
