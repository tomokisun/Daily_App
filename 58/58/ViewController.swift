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

class ViewController: UIViewController {
    
    private var priceView: TotalView!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.register(ItemTableViewCell.nib, forCellReuseIdentifier: ItemTableViewCell.name)
        }
    }
    @IBOutlet private weak var totalPriceView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commonView = TotalView.loadFromNib()
        priceView = commonView
        totalPriceView.addSubview(priceView)
        priceView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.name) else {
            assertionFailure("error")
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "3月25日"
    }
    
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return 3
    }
}
