//
//  SpeciesElement.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 3/3/21.
//

import Foundation

struct SpeciesElement: Decodable {
    let evolutionChain: SpeciesEvolutionChain
    //let flavorTextEntries: [SpeciesFlavorTextEntries]
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case evolutionChain = "evolution_chain"
        //case flavorTextEntries = "flavor_text_entries"
        case id = "id"
        case name = "name"
    }
}
