//
//  HomeTableViewCell.swift
//  57
//
//  Created by 築山朋紀 on 2019/03/23.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Nuke

extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        Nuke.loadImage(with: url, into: self)
    }
}

class HomeTableViewCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: UIImageView! {
        didSet {
            iconImageView.layer.cornerRadius = 25
        }
    }
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!
    
    func update(with home: HomeModel) {
        nameLabel.text = home.user.name
        bodyLabel.text = home.body
        iconImageView.setImage(with: home.user.iconURL)
    }
}
