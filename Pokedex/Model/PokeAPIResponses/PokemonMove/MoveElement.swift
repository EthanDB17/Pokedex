//
//  MoveElement.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/19/21.
//

import Foundation

struct MoveElement: Decodable {
    let move: Move
    let versionGroupDetails: [VersionGroupDetail]
    
    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }
}
