//
//  RepositoryTableViewCell.swift
//  iOS-Redux-study
//
//  Created by AtsuyaSato on 2018/02/04.
//  Copyright © 2018年 Atsuya Sato. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var repositoryDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(repository: Repository) {
        self.thumbnailImage.kf.setImage(with: repository.owner.avatarUrl)
        self.repositoryName.text = repository.fullName
        self.repositoryDescription.text = repository.description
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
