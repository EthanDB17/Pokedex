//
//  Pokemon.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/19/21.
//

import Foundation
import UIKit

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
    let moves: [MoveElement]
    let stats: [StatElement]
    let types: [TypeElement]
}
