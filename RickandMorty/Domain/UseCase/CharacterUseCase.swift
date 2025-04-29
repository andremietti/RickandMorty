//
//  CharacterUseCase.swift
//  RickandMorty
//
//  Created by andre mietti on 14/04/25.
//

import Foundation
import Combine
import Networking

class CharacterUseCase: CharacterUseCaseProtocol {
    
    private var serviceManager: NetworkManagerProtocol
    @Published var requestModel: RequestModel?
    @Published var charactersError: String = String()
    private var cancellables = Set<AnyCancellable>()
    
    @Published var name: String = "Mietti"
    
    init(serviceManager: NetworkManagerProtocol = NetworkService()) {
        self.serviceManager = serviceManager
    }
    
    func getCharacters() {
        serviceManager.request(endPoint: APIEndPoint.character, type: RequestModel.self)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    debugPrint("Finished")
                case .failure(let error):
                    self?.charactersError = error.debugDescription
                }
            } receiveValue: { [weak self] model in
                self?.requestModel = model

            }
            .store(in: &cancellables)
    }

    func loadNextPage(page: Int) {
        var endPoint = APIEndPoint.character
        endPoint.setParam(params: ["page" :"\(page)"])
        serviceManager.request(endPoint: endPoint, type: RequestModel.self)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    debugPrint("Finished")
                case .failure(let error):
                    self?.charactersError = error.debugDescription
                }
            } receiveValue: { [weak self] model in
                self?.requestModel = model

            }
            .store(in: &cancellables)
    }

// TODO: - Search by name
//    func getCharacterByName(name: String) {
//        serviceManager.request(endPoint: APIEndPoint.character, type: RequestModel.self)
//            .receive(on: RunLoop.main)
//            .sink { [weak self] completion in
//                switch completion {
//                case .finished:
//                    debugPrint("Finished")
//                case .failure(let error):
//                    self?.charactersError = error.debugDescription
//                }
//            } receiveValue: { [weak self] model in
//                self?.requestModel = model
//            }
//            .store(in: &cancellables)
//    }
    
}
