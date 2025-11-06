//
//  CharacterModel.swift
//  RickandMorty
//
//  Created by andre mietti on 13/04/25.
//

import Foundation

typealias Characters = [Character]

struct Character: Decodable {
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: Origin
    var location: CharacterLocation
    var image: String
    var episode: [String]
    var url: String
    var created: String
    
    var createdCharacter: String? {
        let date = created.formatToDefault()
        return date?.stringFromDate()
    }
}


