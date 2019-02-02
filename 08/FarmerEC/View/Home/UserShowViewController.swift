//
//  UserShowViewController.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import UIKit

class UserShowViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var product = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        navigationItem.title = "商品一覧"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
        self.product.append("人参")
        self.product.append("キャベツ")
        self.product.append("玉ねぎ")
        self.product.append("きゅうり")
        self.product.append("ネギ")
    }
}

extension UserShowViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return product.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
//        cell.textLabel?.text = products[indexPath.row].name
        cell.textLabel?.text = product[indexPath.row]
        return cell
    }
}

extension UserShowViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "保存", message: "カートに保存しました", preferredStyle: .alert)
        let done = UIAlertAction(title: "閉じる", style: .default) { _ in
            let userDefaults = UserDefaults.standard
            var item = [String]()
            if userDefaults.array(forKey: "Cart") != nil {
                item = userDefaults.array(forKey: "Cart") as! [String]
            }
            item.append(self.product[indexPath.row])
            userDefaults.set(item, forKey: "Cart")
        }
        alert.addAction(done)
        self.present(alert, animated: true)
    }
}
