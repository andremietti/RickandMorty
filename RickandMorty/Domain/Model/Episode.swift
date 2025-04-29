//
//  Episode.swift
//  RickandMorty
//
//  Created by andre mietti on 13/04/25.
//

import Foundation

struct Episode: Codable {
    var id: Int
    var name: String
    var episode: String
    var characters: [String]
    var url: String
}
