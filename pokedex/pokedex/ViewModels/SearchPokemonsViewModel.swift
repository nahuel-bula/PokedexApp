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
    var loading: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    private var currentPage = 0
    var session: ApiClientProtocol
    
    init(session: ApiClientProtocol = PokemonApiClient()) {
        self.session = session
        getPokemons()
    }
    
    func getPokemons() {
        guard let url = URL(string: "\(Constants.API.host)/\(Constants.API.Keys.pokemon)?\(Constants.API.Queries.limit)=\(Constants.pageSize)&\(Constants.API.Queries.offset)=\(currentPage*Constants.pageSize)") else {
            return
        }
        
        loading = true
        
        session.getPokemons(for: url)
            .sink(receiveCompletion: { completion in
                self.loading = false
                if case .failure(let error) = completion {
                    ErrorHandler.handle(error)
                }
            }, receiveValue: { [weak self] response in
                self?.pokemons.append(contentsOf: response.results)
                self?.currentPage += 1
            })
            .store(in: &cancellables)
    }
}
