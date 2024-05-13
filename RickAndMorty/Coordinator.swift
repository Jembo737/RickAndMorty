//
//  Coordinator.swift
//  RickAndMorty
//
//  Created by Jemo on 23.04.24.
//

import UIKit
//import ApiClient

class CharactersDIContainer {
    func makeApiClient() -> ApiClient { 
        ApiClient()
    }
    
    func makeCharactersViewController() -> CharactersViewController {
        let initialViewController = CharactersViewController(vm: makeCharactersViewModel())
        return initialViewController
    }
    
    func makeCharactersViewModel() -> CharactersViewModel {
        return CharactersViewModel(api: makeApiClient())
    }
}

protocol Coordinator {
    func startCoordinator()
}

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    let diContainer: CharactersDIContainer = .init()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func startCoordinator() {
        let initialViewController = diContainer.makeCharactersViewController()
        navigationController.pushViewController(initialViewController, animated: false)
    }
    
    
}
