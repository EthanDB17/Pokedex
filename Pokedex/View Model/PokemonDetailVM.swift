//
//  PokemonDetailVM.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 3/3/21.
//

import SwiftUI

class PokemonDetailVM: ObservableObject {
    var pokemon: Pokemon
    @Published var pokemonSpecies: SpeciesElement? = nil

    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    func fetchPokemonSpecies() {
        guard let url = URL(string: pokemon.species.url) else { return }
        print(url)
        
        let pokemonSpeciesTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let data = data else { return }
            print(data)
            guard let fetchedSpecies = try? JSONDecoder().decode(SpeciesElement.self, from: data) else { return }
            
            DispatchQueue.main.async {
                self?.pokemonSpecies = fetchedSpecies
            }
        }
        
        pokemonSpeciesTask.resume()
    }
    
    func getPokemonType() -> String {
        return pokemon.types.map { $0.type.name.capitalized }.joined(separator: " / ")
    }
}
