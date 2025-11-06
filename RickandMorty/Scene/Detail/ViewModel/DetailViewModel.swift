//
//  
//  DetailViewModel.swift
//  RickandMorty
//
//  Created by andre mietti on 16/10/25.
//
//
import Foundation

class DetailViewModel {
    
    // MARK: - Properties
    @Published var character: Character?
    
    // MARK: - Setup
    init(character: Character) {
        self.character = character
    }
    
    
}
