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
    var totalPages = 0
    var page = 1
    
    init(api: ApiClientProtocol) {
        self.api = api
    }
    
    func fetchCharacters() async {
        do {
            let response: CharacterResponse = try await api.fetchData(with: api.basicURL())
            //            characters.append(contentsOf: response.results.map(CharacterItemViewModel.init))
            totalPages = response.info.pages
            characters = response.results.map(CharacterItemViewModel.init)
        } catch {
            print("Error fetching characters: \(error)")
            // Optionally propagate the error to the caller
            //            throw error
        }
    }
    
    func fetchImage(index: IndexPath) async -> Data? {
        do {
            let result = try await api.fetchData(with: characters[index.row].image)
            return result
        } catch {
            print("Did return error in fetching Image: \(error.localizedDescription)")
            return nil
        }
    }
    
    func fetchMoreCharacters() async {
        do {
            let response: CharacterResponse = try await api.fetchMoreData(for: page)
            let newCharacters = response.results.map(CharacterItemViewModel.init)
            characters += newCharacters
            print("Succes")
        } catch {
            print("Error fetching additional characters: \(error)")
        }
    }
}
