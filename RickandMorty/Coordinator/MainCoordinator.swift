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
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController(viewModel: HomeViewModel())
        homeViewController.coordinator = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
}
