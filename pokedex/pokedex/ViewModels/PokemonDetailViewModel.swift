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
    var loading: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    var session: ApiClientProtocol
    
    init(session: ApiClientProtocol = PokemonApiClient()) {
        self.session = session
    }
    
    func getPokemonDetail(name: String) {
        guard let url = URL(string: "\(Constants.API.host)/\(Constants.API.Keys.pokemon)/\(name)") else {
            return
        }
        
        loading = true
        
        session.getPokemonDetails(for: url)
            .sink(receiveCompletion: { completion in
                self.loading = false
                if case .failure(let error) = completion {
                    ErrorHandler.handle(error)
                }
            }, receiveValue: { [weak self] response in
                self?.pokemonDetail = response
                self?.saveToCache(response, name: name)
            })
            .store(in: &cancellables)
    }
    
    func updateFavorite() {
        guard let pokemonDetail = pokemonDetail else { return }
        
        if isFavorite() {
            AppManager.shared.savedPokemons.removeAll(where: { $0.name == pokemonDetail.name })
        } else {
            AppManager.shared.savedPokemons.append(SavedPokemon(name: pokemonDetail.name, types: pokemonDetail.types, imageUrl: pokemonDetail.portraitPicture))
        }
    }
    
    func isFavorite() -> Bool {
        guard let pokemonDetail = pokemonDetail else { return false }
        
        return AppManager.shared.savedPokemons.contains(where: { $0.name == pokemonDetail.name })
    }
    
    private func loadFromCache(name: String) -> PokemonDetail? {
        if let cachedData = UserDefaults.standard.data(forKey: "\(cacheKey(for: name))"),
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
        return "\(Constants.UserDefaults.pokemonDetailPrefix)_\(name)"
    }
}
