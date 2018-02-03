//
//  RepositoryModel.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/30.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation

struct Repository: Codable {
    var fullName: String
    var description: String?
    var language: String?
    var url: String
    var owner: User

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case description
        case language
        case url
        case owner
    }

    struct User: Codable {
        var login: String
        var id: Int64
        var avatarUrl: URL

        enum CodingKeys: String, CodingKey {
            case login
            case id
            case avatarUrl = "avatar_url"
        }
    }
}
