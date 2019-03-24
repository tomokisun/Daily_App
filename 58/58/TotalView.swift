//
//  TotalView.swift
//  58
//
//  Created by 築山朋紀 on 2019/03/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class TotalView: UIView {
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var totalPrice: UILabel!
}

final class ItemTableViewCell: UITableViewCell {
    @IBOutlet private weak var iconImageView: iconImageView!
    @IBOutlet private weak var serviceNameLabel: UILabel!
    @IBOutlet private weak var planLabel: UILabel!
    @IBOutlet private weak var updateLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
}
