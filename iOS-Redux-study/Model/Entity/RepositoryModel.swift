//
//  RepositoryModel.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/01/30.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import Foundation

struct Repository: Codable {
    private(set) var id: String?
    private(set) var isPrivate: Bool?
    private(set) var title: String?
    private(set) var body: String?
    private(set) var renderedBody: String?
    private(set) var url: String?
    private(set) var coEditing: Bool?
    private(set) var createdAt: String?
    private(set) var updatedAt: String?
}
