//
//  Repository.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import Foundation

struct Repository: Codable {

    let id: Int
    let name: String
    let description: String?
    let owner: Owner
    let stargazersCount: Int
    
    init(id: Int, name: String, description: String, owner: Owner,stargazersCount: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.owner = owner
        self.stargazersCount = stargazersCount
    }

    private enum CodingKeys: String, CodingKey {
        case id, name, description, owner
        case stargazersCount = "stargazers_count"
    }
    
    func encode(to encoder: Encoder) throws {
        var container =  encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(owner, forKey: .owner)
        try container.encode(stargazersCount, forKey: .stargazersCount)
    }

}
