//
//  PokemonCellVM.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/19/21.
//

import Foundation
import UIKit

class PokemonCellVM {
    let pokemon: Pokemon
    
    init (pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    func getPokemonType() -> String {
        return pokemon.types.map { $0.type.name.capitalized }.joined(separator: " /\n")
    }
    
    func getCellBackgroundColor() -> UIColor {
        return PokemonHelper.GetTypeColor(forPokemon: pokemon)
    }
}
