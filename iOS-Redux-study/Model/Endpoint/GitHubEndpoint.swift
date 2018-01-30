//
//  GitHubEndpoint.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/31.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import APIKit

struct FetchRepositoryRequest: GitHubRequest {
    typealias Response = [Repository]

    var userName: String

    init(userName: String) {
        self.userName = userName
    }

    var path: String {
        return "/users/\(self.userName)/repos"
    }

    var method: HTTPMethod {
        return .get
    }
}
