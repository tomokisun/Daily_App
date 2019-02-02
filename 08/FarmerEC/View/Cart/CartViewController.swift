//
//  CartViewController.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var item = [String]()
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        navigationItem.title = "カートの中身"
        tableView.dataSource = self
        self.item = userDefaults.array(forKey: "Cart") as! [String]
        tableView.reloadData()
        
        let button = UIBarButtonItem(title: "購入", style: .done, target: self, action: #selector(self.doneButton))
        navigationItem.setRightBarButton(button, animated: true)
    }
    
    @objc private func doneButton() {
        self.performSegue(withIdentifier: "toPurchase", sender: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.item = userDefaults.array(forKey: "Cart") as! [String]
        tableView.reloadData()
    }
}

extension CartViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)
        cell.textLabel?.text = item[indexPath.row]
        return cell
    }
}
