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

class ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet private weak var inputFieldBottom: NSLayoutConstraint!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.tableFooterView = UIView()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RxKeyboard.instance.visibleHeight.asDriver().drive(onNext: { [weak self] height in
            guard let `self` = self else { return }
            self.inputFieldBottom.constant = height
        }).disposed(by: disposeBag)
    }

    @IBAction private func pushButtonDidTappend(_ sender: UIButton) {
        let text = textField.text!
        if text.isEmpty { return }
    }
}


