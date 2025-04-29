//
//  
//  HomeViewModel.swift
//  RickandMorty
//
//  Created by andre mietti on 10/04/25.
//
//
import Foundation
import Combine

class HomeViewModel {

    // MARK: - Properties
    @Published var characters: Characters?
    @Published var resultInfo: ResultInfo?
    @Published var nextPage = 0
    @Published private var useCase: CharacterUseCase
    private var cancellables = Set<AnyCancellable>()
    private var actualPage: Int = 0
    
    
    // MARK: - Setup
    init(useCase: CharacterUseCase = CharacterUseCase()) {
        self.useCase = useCase
    }
        
}


//MARK: - Functional methods
extension HomeViewModel {
    
    func fecthCharacters() {
        useCase.getCharacters()
        useCase.$requestModel
            .sink { model in
                if self.characters == nil {
                    self.characters = model?.results
                } else {
                    guard let results = model?.results else { return }
                    self.characters?.append(contentsOf: results)
                }
                
                if let next = model?.info.next?.last {
                    self.nextPage = Int(next.description).defaultValue
                }
            }
            .store(in: &cancellables)
    }
    
//TODO: - Search by name
//    func fecthCharacterByName(name: String) {
//        useCase.getCharacterByName(name: name)
//        useCase.$requestModel
//            .sink { results in
//                
//            }
//            .store(in: &cancellables)
//    }
    
    func loadMoreContent() {
        useCase.loadNextPage(page: self.nextPage)
        actualPage = nextPage
    }
}
