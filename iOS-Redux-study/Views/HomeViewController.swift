//
//  HomeViewController.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/31.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import UIKit
import RxSwift
import ReSwift
import RxCocoa

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    private lazy var dataSource: HomeTableViewDataSource = .init(store: rxReduxStore)
    private var rxReduxStore: RxReduxStore<AppState>!
    private let disposeBag = DisposeBag()

    func inject(rxReduxStore: RxReduxStore<AppState>) {
        self.rxReduxStore = rxReduxStore
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tableView.delegate = self
        dataSource.configure(with: self.tableView)
    self.rxReduxStore.dispatch(GitHubAPIActionCreator.generateListRepositoryAction(userName: "natmark"))

        bind()
    }

    func bind() {
        rxReduxStore.stateObservable
            .map { $0.homeState.repositories }
            .subscribe(onNext: { _ in
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
