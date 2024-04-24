//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Jemo on 23.04.24.
//

import UIKit

protocol Coordinator {
    func startCoordinator()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let initialViewController = CharactersViewController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(initialViewController, animated: false)
    }
    
    
}
