//
//  RxThunkMiddleware.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/31.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import ReSwift
import RxSwift

struct SingleAction: ReSwift.Action {
    public let single: Single<ReSwift.Action>
    public let disposeBag: DisposeBag
}

let rxThunkMiddleWare: ReSwift.Middleware<AppState> = { dispatch, getState in
    return { next in
        return { action in
            if let action = action as? SingleAction {
                action.single
                    .observeOn(MainScheduler.instance)
                    .subscribe(onSuccess: { next($0) })
                    .disposed(by: action.disposeBag)
            } else {
                return next(action)
            }
        }
    }
}
