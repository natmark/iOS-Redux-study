//
//  RxReduxStore.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/30.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

public class RxReduxStore<AppStateType>: StoreSubscriber where AppStateType: StateType {
    public lazy var stateObservable: Observable<AppStateType> = {
        return self.stateVariable.asObservable().observeOn(MainScheduler.instance).share()
    }()
    public var state: AppStateType { return stateVariable.value }
    private let stateVariable: Variable<AppStateType>
    private let store: Store<AppStateType>

    public init(store: Store<AppStateType>) {
        self.store = store
        self.stateVariable = Variable(store.state)
        self.store.subscribe(self)
    }

    deinit {
        self.store.unsubscribe(self)
    }

    public func newState(state: AppStateType) {
        self.stateVariable.value = state
    }

    public func dispatch(_ action: Action) {
        store.dispatch(action)
    }

    public func dispatch(_ actionCreatorProvider: @escaping (AppStateType, ReSwift.Store<AppStateType>) -> Action?) {
        store.dispatch(actionCreatorProvider)
    }
}
