//
//  Owner.swift
//  SwiftRepositories (iOS)
//
//  Created by Torres Conrado, Andre Vinicius on 21/07/21.
//

import Foundation

struct Owner: Codable {

    let login: String
    let avatarUrl: String

    enum CodingKeys: String, CodingKey {
        case login = "login"
        case avatarUrl = "avatar_url"
    }
    
    func encode(to encoder: Encoder) throws {
        var container =  encoder.container(keyedBy: CodingKeys.self)
        try container.encode(login, forKey: .login)
        try container.encode(avatarUrl, forKey: .avatarUrl)
    }

    init() {
        login = String()
        avatarUrl = String()
    }

}
