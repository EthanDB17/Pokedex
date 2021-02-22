//
//  PokemonList.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/14/21.
//

import Foundation

struct PokemonList: Decodable {
    let count: Int
    let next: String?
    let results: [PokemonListResult]
}
