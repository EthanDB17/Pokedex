//
//  StatElement.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/19/21.
//

import Foundation

struct StatElement: Decodable {
    let baseStat: Int
    let stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}
