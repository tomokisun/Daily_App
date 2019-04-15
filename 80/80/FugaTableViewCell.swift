//
//  FugaTableViewCell.swift
//  80
//
//  Created by 築山朋紀 on 2019/04/15.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class FugaTableViewCell: UITableViewCell {
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet private weak var baseView: UIView! {
        didSet {
            baseView.layer.cornerRadius = 18
            baseView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
}
