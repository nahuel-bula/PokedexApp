//
//  SearchPokemonsViewModel.swift
//  Pokedex
//
//  Created by Nahuel Bula on 13/2/24.
//

import Foundation
import Combine

class SearchPokemonViewModel: ObservableObject {
    @Published var pokemons: [PokemonListItem] = []
    private var cancellables: Set<AnyCancellable> = []
    private var currentPage = 0
    
    init() {
        fetchPokemons()
    }
    
    func fetchPokemons() {
        guard let url = URL(string: "\(Constants.API.host)/\(Constants.API.Keys.pokemon)?\(Constants.API.Queries.limit)=\(Constants.pageSize)&\(Constants.API.Queries.offset)=\(currentPage*Constants.pageSize)") else {
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: PokemonListResponse.self, decoder: ApiDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.pokemons.append(contentsOf: response.results)
                self?.currentPage += 1
            })
            .store(in: &cancellables)
    }
}
