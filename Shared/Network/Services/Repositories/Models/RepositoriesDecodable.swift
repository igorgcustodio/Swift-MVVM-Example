//
//  RepositoriesDecodable.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import Foundation

struct RepositoriesDecodable: Decodable {

    let totalCount: Int
    let incompleteResults: Bool
    let repositories: [Repository]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case repositories = "items"
    }

}
