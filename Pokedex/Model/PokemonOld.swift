//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/14/21.
//

import Foundation

struct PokemonOld: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}
