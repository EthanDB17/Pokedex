//
//  SpeciesFlavorTextEntries.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 3/3/21.
//

import Foundation

struct SpeciesFlavorTextEntries: Decodable {
    let flavorText: String
    let language: FlavorTextLanguage
    let version: FlavorTextVersion
    
    enum CodingKeys: String, CodingKey {
        case flavorText = "flavor_text"
        case language = "language"
        case version = "version"
    }
}
