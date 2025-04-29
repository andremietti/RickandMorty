//
//  CharacterService.swift
//  RickandMorty
//
//  Created by andre mietti on 14/04/25.
//

import Foundation
import Combine
import Networking

protocol CharacterUseCaseProtocol {
    func getCharacters()
    func loadNextPage(page: Int)
    
//TODO: - Search by name
//    func getCharacterByName(name: String)
}
