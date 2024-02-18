//
//  Pokedex_Tests.swift
//  Pokedex_Tests
//
//  Created by Nahuel Bula on 17/2/24.
//

import XCTest
import Combine
@testable import Pokedex

class SearchPokemonViewModelTests: XCTestCase {
    var searchPokemonViewModel: SearchPokemonViewModel!
    var pokemonDetailViewModel: PokemonDetailViewModel!
    var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
        super.setUp()
        searchPokemonViewModel = SearchPokemonViewModel()
        pokemonDetailViewModel = PokemonDetailViewModel()
    }
    
    override func tearDown() {
        searchPokemonViewModel = nil
        pokemonDetailViewModel = nil
        cancellables = []
        super.tearDown()
    }
    
    func testGetPokemons() {
        // Given
        let mockData = """
            {
              "results": [
                {
                  "name": "bulbasaur",
                  "url": "https://pokeapi.co/api/v2/pokemon/1/"
                },
                {
                  "name": "charmander",
                  "url": "https://pokeapi.co/api/v2/pokemon/4/"
                }
              ]
            }
        """.data(using: .utf8)!
        let mockResponse: PokemonListResponse
        do {
            mockResponse = try ApiDecoder().decode(PokemonListResponse.self, from: mockData)
        } catch {
            XCTFail("Failed to decode mock response: \(error)")
            return
        }
        
        let mockSession = MockPokemonApiClient(mockData: mockData)
        let expectation = self.expectation(description: "Fetch pokemons expectation")
        
        // Inject mock session into view model
        searchPokemonViewModel.session = mockSession
        
        searchPokemonViewModel.getPokemons()
        
        // Then
        searchPokemonViewModel.$pokemons.sink { pokemons in
            // Check if pokemons are loaded correctly
            XCTAssertEqual(pokemons, mockResponse.results)
            expectation.fulfill()
        }.store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testGetPokemonDetail() {
        // Given
        let mockData = """
            {
              "abilities": [
                {
                  "ability": {
                    "name": "limber",
                    "url": "https://pokeapi.co/api/v2/ability/7/"
                  },
                  "is_hidden": false,
                  "slot": 1
                },
                {
                  "ability": {
                    "name": "imposter",
                    "url": "https://pokeapi.co/api/v2/ability/150/"
                  },
                  "is_hidden": true,
                  "slot": 3
                }
              ],
              "height": 3,
              "id": 132,
              "name": "ditto",
              "species": {
                "name": "ditto",
                "url": "https://pokeapi.co/api/v2/pokemon-species/132/"
              },
              "sprites": {
                "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png",
                "back_female": null,
                "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/132.png",
                "back_shiny_female": null,
                "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png",
                "front_female": null,
                "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/132.png",
                "front_shiny_female": null,
                "other": {
                  "dream_world": {
                    "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/132.svg",
                    "front_female": null
                  },
                  "home": {
                    "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/132.png",
                    "front_female": null,
                    "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/132.png",
                    "front_shiny_female": null
                  },
                  "official-artwork": {
                    "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png",
                    "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/132.png"
                  },
                  "showdown": {
                    "back_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/132.gif",
                    "back_female": null,
                    "back_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/back/shiny/132.gif",
                    "back_shiny_female": null,
                    "front_default": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/132.gif",
                    "front_female": null,
                    "front_shiny": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/shiny/132.gif",
                    "front_shiny_female": null
                  }
                }
            },
              "stats": [
                {
                  "base_stat": 48,
                  "effort": 1,
                  "stat": {
                    "name": "hp",
                    "url": "https://pokeapi.co/api/v2/stat/1/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "attack",
                    "url": "https://pokeapi.co/api/v2/stat/2/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "defense",
                    "url": "https://pokeapi.co/api/v2/stat/3/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "special-attack",
                    "url": "https://pokeapi.co/api/v2/stat/4/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "special-defense",
                    "url": "https://pokeapi.co/api/v2/stat/5/"
                  }
                },
                {
                  "base_stat": 48,
                  "effort": 0,
                  "stat": {
                    "name": "speed",
                    "url": "https://pokeapi.co/api/v2/stat/6/"
                  }
                }
              ],
              "types": [
                {
                  "slot": 1,
                  "type": {
                    "name": "normal",
                    "url": "https://pokeapi.co/api/v2/type/1/"
                  }
                }
              ],
              "weight": 40
            }
        """.data(using: .utf8)!
        let mockResponse: PokemonDetail
        do {
            mockResponse = try ApiDecoder().decode(PokemonDetail.self, from: mockData)
        } catch {
            XCTFail("Failed to decode mock response: \(error)")
            return
        }
        
        let mockSession = MockPokemonApiClient(mockData: mockData)
        let expectation = self.expectation(description: "Fetch pokemons expectation")
        
        // Inject mock session into view model
        pokemonDetailViewModel.session = mockSession
        
        pokemonDetailViewModel.getPokemonDetail(name: "ditto")
        
        // Then
        pokemonDetailViewModel.$pokemonDetail.sink { pokemon in
            // Check if pokemons are loaded correctly
            XCTAssertEqual(pokemon, mockResponse)
            expectation.fulfill()
        }.store(in: &cancellables)
        
        waitForExpectations(timeout: 5, handler: nil)
    }
}
