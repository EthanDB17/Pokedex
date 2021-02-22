//
//  PokemonVM.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/14/21.
//

import SwiftUI

class PokemonVM: ObservableObject {
    @Published var pokemonOld = [PokemonOld]()
    @Published var pokemon = [Pokemon]()
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    let baseAPIURL = "https://pokeapi.co/api/v2/pokemon?limit=151&offset=0"
    
    init() {
        //fetchPokemonOld()
        
        
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
            })
        }
        
        initialListTask.resume()
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type.lowercased() {
        case "fire":
            return .systemRed
        case "poison", "grass", "bug":
            return .systemGreen
        case "water", "dragon":
            return .systemBlue
        case "electric":
            return .systemYellow
        case "psychic":
            return .systemPurple
        case "normal", "steel", "rock":
            return .systemGray
        case "ground", "fighting":
            return .systemOrange
        case "flying", "ice":
            return .systemTeal
        case "fairy":
            return .systemPink
        default:
            return .systemIndigo
        }
    }

    func fetchPokemonOld() {
        guard let url = URL(string: baseURL) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([PokemonOld].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self?.pokemonOld = pokemon
            }
        }
        
        task.resume()
    }
    
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
