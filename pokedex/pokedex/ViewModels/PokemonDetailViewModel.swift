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
            })
            .store(in: &cancellables)
    }
}
