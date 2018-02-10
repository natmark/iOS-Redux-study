//
//  HomeState.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/30.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift

struct HomeState: StateType {
    var fetching: Bool = false
    var error: Error? = nil
    var requestDisposeBag = DisposeBag()
    var repositories = [Repository]()
}
