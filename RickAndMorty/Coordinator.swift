//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Jemo on 23.04.24.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    
    func startCoordinator()
}

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let initialViewController = ViewController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(initialViewController, animated: false)
    }
    
    
}
