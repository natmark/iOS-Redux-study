//
//  HomeTableViewDataSource.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/02/04.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import UIKit
import RxSwift

class HomeTableViewDataSource: NSObject {
    fileprivate let cellIdentifier = "RepositoryTableViewCell"
    private let store: RxReduxStore<AppState>
    private let disposeBag = DisposeBag()

    var rxReduxStore: RxReduxStore<AppState>!

    init(store: RxReduxStore<AppState>) {
        self.store = store
    }

    func configure(with tableView: UITableView) {
        tableView.dataSource = self

        let viewNib = UINib(nibName: cellIdentifier, bundle: nil)
        tableView.register(viewNib, forCellReuseIdentifier: cellIdentifier)
    }
}

extension HomeTableViewDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.state.homeState.repositories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RepositoryTableViewCell else {
            return UITableViewCell()
        }

        let repository = store.state.homeState.repositories[indexPath.row]
        cell.configure(repository: repository)

        return cell
    }
}
