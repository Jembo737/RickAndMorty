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
    
    var characters = [Character]()
    
    init(api: ApiClientProtocol) {
        self.api = api
    }
    
    func fetchCharacters() async throws {
        do {
            let response: CharacterResponse = try await api.fetchData()
            characters = response.results
            print(characters)
        } catch {
            print("Error fetching characters: \(error)")
            // Optionally propagate the error to the caller
            throw error
        }
    }
}
