//
//  PokemonStatsVM.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 3/8/21.
//

import Foundation
import UIKit

struct PokemonStatsVM {
    let pokemonStats: [StatElement]
    
    init(stats: [StatElement]) {
        self.pokemonStats = stats
    }
    
    func calculateStatColor(forStatValue statValue: Int) -> UIColor {
        switch statValue {
        case 0...25:
            return UIColor(red: 0.949, green: 0.267, blue: 0.263, alpha: 1.00)
        case 26...60:
            return UIColor(red: 0.954, green: 0.500, blue: 0.064, alpha: 1.00)
        case 61...89:
            return UIColor(red: 0.975, green: 0.867, blue: 0.340, alpha: 1.00)
        case 90...119:
            return UIColor(red: 0.628, green: 0.804, blue: 0.367, alpha: 1.00)
        case 120...135:
            return UIColor(red: 0.258, green: 0.804, blue: 0.367, alpha: 1.00)
        default:
            return UIColor(red: 0.258, green: 0.804, blue: 0.367, alpha: 1.00)
        }
    }
}
