//
//  GitHubAPIActionCreator.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/31.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import RxSwift
import ReSwift

struct GitHubAPIActionCreator {
    static func generateListRepositoryAction(userName: String) -> Store<AppState>.ActionCreator {
        return { (state: AppState, store: Store<AppState>) in
            if state.homeState.fetching { return nil }
            store.dispatch(HomeState.Action.requestState(fetching: true))

            let s = GitHubManager.shared.repositories(userName: userName)
                .asSingle()
                .map {
                    return HomeState.Action.requestSuccess(repositories: $0)
                }
                .catchError { (error) -> Single<ReSwift.Action> in
                    let action = HomeState.Action.requestError(error: error)
                    return Single<ReSwift.Action>.just(action)
            }

            return SingleAction(single: s, disposeBag: state.homeState.requestDisposeBag)
        }
    }
}
