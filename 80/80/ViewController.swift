//
//  ViewController.swift
//  80
//
//  Created by 築山朋紀 on 2019/04/15.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxKeyboard

class Message {
    let body: String
    let senderId: Int
    
    init(body: String, senderID: Int) {
        self.body = body
        self.senderId = senderID
    }
}

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private var messages = [Message]() {
        didSet {
            tableView.reloadData()
        }
    }
    private var count = 0
    
    @IBOutlet private weak var inputFieldBottom: NSLayoutConstraint!
    @IBOutlet private weak var textField: UITextField! {
        didSet {
            textField.layer.cornerRadius = 16
            textField.layer.borderWidth = 1
            textField.layer.borderColor = UIColor(named: "border")?.cgColor
            textField.clipsToBounds = true
        }
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
            tableView.register(HogeTableViewCell.nib, forCellReuseIdentifier: HogeTableViewCell.name)
            tableView.register(FugaTableViewCell.nib, forCellReuseIdentifier: FugaTableViewCell.name)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "さりぃ"
        RxKeyboard.instance.visibleHeight.asDriver().drive(onNext: { [weak self] height in
            guard let `self` = self else { return }
            self.inputFieldBottom.constant = height
        }).disposed(by: disposeBag)
    }

    @IBAction private func pushButtonDidTappend(_ sender: UIButton) {
        let text = textField.text!
        if text.isEmpty { return }
        textField.text?.removeAll()
        messages.append(Message(body: text, senderID: 0))
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.random()
        }
    }
    
    private func random() {
        var text: String
        if count == 0 {
            text = "うーんどうしようか、Googleフォームでなにかいいアイデア来てないかなそろそろネタ切れだね、、！"
        } else {
            text = "みんなアイデアを投稿して欲しい！！"
        }
        messages.append(Message(body: text, senderID: 1))
        count = 1
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messages[indexPath.row].senderId == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: HogeTableViewCell.name, for: indexPath) as? HogeTableViewCell else {
                fatalError("error")
            }
            cell.bodyLabel.text = messages[indexPath.row].body
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: FugaTableViewCell.name, for: indexPath) as? FugaTableViewCell else {
                fatalError("error")
            }
            cell.bodyLabel.text = messages[indexPath.row].body
            return cell
        }
    }
}


