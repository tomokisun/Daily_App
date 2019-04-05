//
//  ViewController.swift
//  70
//
//  Created by 築山朋紀 on 2019/04/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

var memoList = [String]()

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.register(ListTableViewCell.nib, forCellReuseIdentifier: ListTableViewCell.name)
            tableView.register(NewTableViewCell.nib, forCellReuseIdentifier: NewTableViewCell.name)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row + 1
        if index <= memoList.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.name, for: indexPath) as! ListTableViewCell
            cell.label.text = memoList[indexPath.row]
            tableView.rowHeight = 100
            cell.selectedBackgroundView = UIView()
            cell.backgroundColor = .clear
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NewTableViewCell.name, for: indexPath) as! NewTableViewCell
            tableView.rowHeight = UIScreen.main.bounds.height
            cell.selectedBackgroundView = UIView()
            cell.backgroundColor = .clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row + 1
        if index > memoList.count {
            self.performSegue(withIdentifier: "modal", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}

class NewMemoViewController: UIViewController {
    
    @IBOutlet private weak var textView: UITextView!
    
    @IBAction private func saveButtonDidTappend() {
        guard let text = textView.text else { return }
        guard !text.isEmpty else { return }
        memoList.append(text)
        self.dismiss(animated: true)
    }
}

protocol NibInitializable {}

extension NibInitializable where Self: UIView {
    static func loadFromNib(index: Int = 0) -> Self {
        guard let view = UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: self, options: nil)[index] as? Self else {
            fatalError("Invalid Nib name")
        }
        return view
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var name: String {
        return String(describing: self)
    }
}

extension UIView: NibInitializable {}
