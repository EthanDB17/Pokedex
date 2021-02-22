//
//  PokemonHelper.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/19/21.
//

import Foundation
import UIKit

class PokemonHelper {
    static func GetTypeColor(forPokemon pokemon:Pokemon) -> UIColor {
        guard let primaryType = pokemon.types.first?.type.name else { return UIColor.lightGray }
        
        switch primaryType.lowercased() {
        case "normal":
            return UIColor(red: 0.667, green: 0.667, blue: 0.602, alpha: 1.00)
        case "fire":
            return UIColor(red: 0.949, green: 0.269, blue: 0.138, alpha:1.00)
        case "water":
            return UIColor(red: 0.277, green: 0.599, blue: 1.000, alpha:1.00)
        case "electric":
            return UIColor(red: 0.970, green: 0.800, blue: 0.204, alpha: 1.00)
        case "grass":
            return UIColor(red: 0.468, green: 0.801, blue: 0.331, alpha: 1.00)
        case "ice":
            return UIColor(red: 0.400, green: 0.801, blue: 1.000, alpha: 1.00)
        case "fighting":
            return UIColor(red: 0.732, green: 0.332, blue: 0.266, alpha: 1.00)
        case "poison":
            return UIColor(red: 0.668, green: 0.335, blue: 0.599, alpha: 1.00)
        case "ground":
            return UIColor(red: 0.866, green: 0.735, blue: 0.331, alpha: 1.00)
        case "flying":
            return UIColor(red: 0.534, green: 0.599, blue: 1.000, alpha: 1.00)
        case "psychic":
            return UIColor(red: 0.955, green: 0.332, blue: 0.600, alpha: 1.00)
        case "bug":
            return UIColor(red: 0.668, green: 0.732, blue: 0.133, alpha: 1.00)
        case "rock":
            return UIColor(red: 0.734, green: 0.669, blue: 0.398, alpha: 1.00)
        case "ghost":
            return UIColor(red: 0.401, green: 0.401, blue: 0.733, alpha: 1.00)
        case "dragon":
            return UIColor(red: 0.468, green: 0.402, blue: 0.935, alpha: 1.00)
        case "dark":
            return UIColor(red: 0.467, green: 0.333, blue: 0.266, alpha: 1.00)
        case "steel":
            return UIColor(red: 0.665, green: 0.665, blue: 0.732, alpha: 1.00)
        case "fairy":
            return UIColor(red: 0.932, green: 0.599, blue: 0.934, alpha: 1.00)
        default:
            return UIColor.lightGray
        }
    }
}

