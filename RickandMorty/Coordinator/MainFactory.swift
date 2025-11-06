//
//  MainFactory.swift
//  RickandMorty
//
//  Created by andre mietti on 16/10/25.
//

import Foundation

final class MainFactory {
    
    func makeHomeViewController(coordinator: MainCoordinator) -> HomeViewController {
        let homeViewController = HomeViewController(viewModel: HomeViewModel())
        homeViewController.coordinator = coordinator
        return homeViewController
    }
    
    func makeDetailViewController(coordinator: MainCoordinator, character: Character) -> DetailViewController {
        let detailViewController = DetailViewController(viewModel: DetailViewModel(character: character))
        return detailViewController
    }
}
