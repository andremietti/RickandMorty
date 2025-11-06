//
//  MainCoordinator.swift
//  RickandMorty
//
//  Created by andre mietti on 11/04/25.
//

import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var factory: MainFactory
    
    init(navigationController: UINavigationController, factory: MainFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let homeViewController = factory.makeHomeViewController(coordinator: self)
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func didShowDetail(character: Character) {
        let detailViewController = factory.makeDetailViewController(coordinator: self, character: character)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
