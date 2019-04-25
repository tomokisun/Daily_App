//
//  ArticleTableViewCell.swift
//  90
//
//  Created by 築山朋紀 on 2019/04/25.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    @IBOutlet private weak var gifImageView: UIImageView!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    
    func update(with model: ArticleModel) {
        dayLabel.text = model.day
        nameLabel.text = model.name
        gifImageView.setGifFromURL(URL(string: model.gifURL))
    }
}

@IBDesignable
class BaseView: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.backgroundColor = .white
        self.layer.cornerRadius = 16
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
    }
}
