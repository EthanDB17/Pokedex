//
//  SpeciesEvolutionChain.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 3/3/21.
//

import Foundation

struct SpeciesEvolutionChain: Decodable {
    let evolutionChain: String
    
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
    }
}
