//
//  ViewController.swift
//  60
//
//  Created by 築山朋紀 on 2019/03/26.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

var tasks = [String]()

final class HomeTableViewCell: UITableViewCell {
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var switchButton: UISwitch!
    
    func update(with task: String) {
        label.text = task
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var button: UIButton! {
        didSet {
            button.layer.cornerRadius = 30
            button.layer.masksToBounds = true
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 0, height: 2)
            button.layer.shadowRadius = 2
        }
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(refreshControlAction), for: .valueChanged)
            tableView.addSubview(refreshControl)
        }
    }
    
    @objc func refreshControlAction(refreshControl: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            refreshControl.endRefreshing()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell") as! HomeTableViewCell
        cell.update(with: tasks[indexPath.row])
        return cell
    }
}

final class TaskAddViewController: UIViewController {
    
    @IBOutlet private weak var textView: UITextView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        textView.resignFirstResponder()
    }
    
    @IBAction private func saveButtonDidTappend() {
        guard let text = textView.text else { return }
        tasks.append(text)
        self.dismiss(animated: true, completion: nil)
    }
}
