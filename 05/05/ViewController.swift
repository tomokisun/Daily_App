//
//  ViewController.swift
//  05
//
//  Created by 築山朋紀 on 2019/01/30.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, TaskAddViewDelegate {
    
    private var items = [String]()
    private var addView: TaskAddView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView = UINib(nibName: "TaskAddView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? TaskAddView
        addView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 367)
        addView.delegate = self
        view.addSubview(addView)
        
        self.tableView.tableFooterView = UIView()
    }
    
    @IBAction private func addTask() {
        setAddTaskhidden(true)
    }
    
    private func setAddTaskhidden(_ hidden: Bool) {
        if hidden {
            UIView.animate(withDuration: 0.5) {
                self.addView.frame.origin.y = self.view.frame.height - 367
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.addView.frame.origin.y = self.view.frame.height
            }
        }
    }
    
    func textField(_ view: TaskAddView, text: String) {
        items.append(text)
        self.tableView.reloadData()
        setAddTaskhidden(false)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        self.tableView.reloadData()
    }
}

