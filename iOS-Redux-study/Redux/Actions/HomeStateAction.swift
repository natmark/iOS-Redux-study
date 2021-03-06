//
//  HomeStateAction.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/30.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import ReSwift

extension HomeState {
    enum Action: ReSwift.Action {
        case requestSuccess(repositories: [Repository])
        case requestState(fetching: Bool)
        case requestError(error: Error)
    }
}
