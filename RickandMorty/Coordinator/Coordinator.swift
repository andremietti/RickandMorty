//
//  Coordinator.swift
//  RickandMorty
//
//  Created by andre mietti on 11/04/25.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    func start()
}
