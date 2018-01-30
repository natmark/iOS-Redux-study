//
//  HomeViewController.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/31.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import UIKit
import ReSwift
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var label: UILabel!

    fileprivate let disposeBag = DisposeBag()
    var rxReduxStore: RxReduxStore<AppState>!

    func inject(rxReduxStore: RxReduxStore<AppState>) {
        self.rxReduxStore = rxReduxStore
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bind()
    }

    func bind() {
        increaseButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.rxReduxStore.dispatch(HomeState.Action.increase)
            })
            .disposed(by: disposeBag)
        decreaseButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.rxReduxStore.dispatch(HomeState.Action.decrease)
            })
            .disposed(by: disposeBag)
        
        rxReduxStore.stateObservable
            .map { String($0.homeState.counter) }
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
    }
}

