//
//  ViewController.swift
//  58
//
//  Created by 築山朋紀 on 2019/03/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import SnapKit
import Template

@IBDesignable class iconImageView: UIImageView {
    @IBInspectable var cornerRadiu: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

class ViewController: UITableViewController {
    
    private var priceView: TotalView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = TotalView.loadFromNib()
        priceView = view
        tableView.addSubview(priceView)
        priceView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
    }
}
