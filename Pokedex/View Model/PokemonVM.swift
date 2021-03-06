//
//  PokemonVM.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/14/21.
//

import SwiftUI

class PokemonVM: ObservableObject {
    @Published var pokemon = [Pokemon]()
    @Published var loadingPokemon = false
    
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    let baseAPIURL = "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0"
    
    init() {
        loadingPokemon = true
        fetchPokemon()
    }
    
    func fetchPokemon() {
        guard let url = URL(string: baseAPIURL) else { return }
        
        let initialListTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else { return }
            guard let pokemonList = try? JSONDecoder().decode(PokemonList.self, from: data) else { return }
            
            let group = DispatchGroup()
            var pokemonResponses = [Pokemon]()
            
            for pokemon in pokemonList.results {
                guard let pokemonUrl = URL(string: pokemon.url) else { return }
                group.enter()
                let pokemonTask = URLSession.shared.dataTask(with: pokemonUrl, completionHandler: { data, response, error in
                    defer {
                        group.leave()
                    }
                    
                    guard let data = data else { return }
                    guard let pokemonResponse = try? JSONDecoder().decode(Pokemon.self, from: data) else { return }
                    
                    pokemonResponses.append(pokemonResponse)
                })
                pokemonTask.resume()
            }
            
            group.notify(queue: .main, execute: {
                self?.pokemon = pokemonResponses.sorted { itemA, itemB in
                    itemA.id < itemB.id
                }
                self?.loadingPokemon = false
            })
        }
        
        initialListTask.resume()
    }
}
