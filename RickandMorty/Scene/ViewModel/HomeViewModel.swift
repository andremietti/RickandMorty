//
//  
//  HomeViewModel.swift
//  RickandMorty
//
//  Created by andre mietti on 10/04/25.
//
//
import Foundation

// MARK: - Protocols
protocol HomeViewModelInput {
    /// put your input methods from ViewController
}

protocol HomeViewModelOutput {
    var showLoading: Observable<Bool> { get }
    var showError: Observable<(title: String, message: String)> { get }
}

protocol HomeViewModelCoordinating {
    func closeScene()
}

protocol HomeViewModelProtocol: HomeViewModelInput, HomeViewModelOutput {}

class HomeViewModel {

    // MARK: - Properties
    private let coordinator: HomeViewModelCoordinating

    // MARK: - Setup
    init(coordinator: HomeViewModelCoordinating) {
        self.coordinator = coordinator
    }

    func closeScene() {
        coordinator.closeScene()
    }
}
