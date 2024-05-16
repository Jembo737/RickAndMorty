//
//  File.swift
//  
//
//  Created by Jemo on 24.04.24.
//

import Foundation

// MARK: - Characters
 public struct CharacterResponse: Decodable {
    public let info: Info
    public let results: [Character]
}

// MARK: - Info
public struct Info: Decodable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

// MARK: - Result
public struct Character: Decodable {
    let id: Int
    let name: String
    let status: Status
    let species: String
    let type: String
    let gender: String
    let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

// MARK: - Location
struct Location: Decodable, Hashable {
    let id = UUID()
    let name: String
    let url: String
}

enum Species: String, Decodable {
    case alien = "Alien"
    case animal = "Animal"
    case human = "Human"
    case mythologicalCreature = "Mythological Creature"
    case humanoid = "Humanoid"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
    
//    var color: UIColor {
//        switch self {
//        case .alive: return UIColor.systemGreen
//        case .dead: return UIColor.systemRed
//        case .unknown: return UIColor.systemGray
//        }
    }


