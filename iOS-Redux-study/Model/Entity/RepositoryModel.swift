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
    var language: String?
    var url: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full_name"
        case language
        case url
    }
}
