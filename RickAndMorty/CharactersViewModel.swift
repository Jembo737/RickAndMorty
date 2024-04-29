//
//  CharactersViewModel.swift
//  RickAndMorty
//
//  Created by Jemo on 24.04.24.
//

import Foundation
import ApiClient

class CharactersViewModel {
    let api: ApiClientProtocol
    
    var characters = [CharacterItemViewModel]()
    
    init(api: ApiClientProtocol) {
        self.api = api
    }
    
    func fetchCharacters() async {
        do {
            let response: CharacterResponse = try await api.fetchData()
//            characters.append(contentsOf: response.results.map(CharacterItemViewModel.init))
            characters = response.results.map(CharacterItemViewModel.init)
            print(response)
        } catch {
            print("Error fetching characters: \(error)")
            // Optionally propagate the error to the caller
//            throw error
        }
    }
}
