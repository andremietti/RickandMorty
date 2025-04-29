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
}

struct CharacterLocation: Codable {
    var name: String
    var url: String
}

struct CharactersData: Decodable {
    var results: [Character]
}

