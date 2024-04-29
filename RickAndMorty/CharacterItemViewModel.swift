//
//  CharacterItemViewModel.swift
//  RickAndMorty
//
//  Created by Jemo on 29.04.24.
//

struct CharacterItemViewModel: Hashable {
    let id: Int
    let name: String
    let status: String
    let image: String
    
//    init(id: Int, name: String, status: String, image: String) {
//        self.id = id
//        self.name = name
//        self.status = status
//        self.image = image
//    }
    
    init(with model: Character) {
        self.id = model.id
        self.name = model.name
        self.status = model.status.rawValue
        self.image = model.image
    }
}
