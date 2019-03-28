//
//  ViewController.swift
//  62
//
//  Created by 築山朋紀 on 2019/03/28.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Template

class ViewController: UIViewController {
    
    private let sections = ["select Frappucino", "select customize"]
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(FrappucinoTableViewCell.nib, forCellReuseIdentifier: FrappucinoTableViewCell.name)
            tableView.register(ToppingTableViewCell.nib, forCellReuseIdentifier: ToppingTableViewCell.name)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FrappucinoTableViewCell.name) as? FrappucinoTableViewCell else {
                fatalError()
            }
            cell.label.text = "抹茶クリームフラペチーノ"
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ToppingTableViewCell.name) as? ToppingTableViewCell else {
                fatalError()
            }
            cell.label.text = "チョコ追加"
            return cell
        }
    }
}
