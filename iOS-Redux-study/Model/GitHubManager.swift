//
//  GitHubManager.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/31.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import RxSwift
import APIKit

class GitHubManager {
    static let shared = GitHubManager()
    private init() {
    }

    func repositories(userName: String) -> Observable<[Repository]> {
        return Session.rx_response(request: FetchRepositoryRequest(userName: userName))
    }
}
