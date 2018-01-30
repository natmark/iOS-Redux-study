//
//  RepositoriesReducer.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/30.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import ReSwift

extension HomeState {
    public static func reducer(action: ReSwift.Action, state: HomeState?) -> HomeState {
        var state = state ?? HomeState()
        guard let action = action as? HomeState.Action else { return state }
        switch action {
        case .increase:
            state.counter += 1
        case .decrease:
            state.counter -= 1
        case .requestSuccess(let repositories):
            state.repositories = repositories
        case .requestError(let error):
            state.error = error
            break
        }
        return state
    }
}
