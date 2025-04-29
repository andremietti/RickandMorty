//
//  CharacterLocation.swift
//  RickandMorty
//
//  Created by andre mietti on 13/04/25.
//

import Foundation

struct Location: Codable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
}
