//
//  PokemonMoveVersionGroupDetail.swift
//  Pokedex
//
//  Created by Ethan Borrowman on 2/19/21.
//

import Foundation

struct VersionGroupDetail: Decodable {
    let levelLearnedAt: Int
    let moveLearnMethod: MoveLearnMethod
    let versionGroup: VersionGroup
    
    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }
}
