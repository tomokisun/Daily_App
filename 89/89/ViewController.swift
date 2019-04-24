//
//  ViewController.swift
//  89
//
//  Created by 築山朋紀 on 2019/04/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var outputLabel: UILabel!
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 文字列を置換する
        var str2 = "すき家の牛丼"
        var str3 = "吉野家の豚丼"
        
        // 文字列が含まれていない場合rangeはnil
        if let range = str2.range(of: "牛丼") {
            // 置換する(変数を直接操作する)
            str2.replaceSubrange(range, with: "ビーフストロガノフ")
        }
        
        if let range = str3.range(of: "牛丼") {
            str3.replaceSubrange(range, with: "ビーフストロガノフ")
        }
        
        print(str2)    // すき家のビーフストロガノフ
        print(str3)    // 吉野家の豚丼
    }
    
    @IBAction private func hoge() {
        guard var text = textField.text else { return }
        guard let str = label.text  else { return }
        if let range = text.range(of: str) {
            text.replaceSubrange(range, with: "令和")
        }
        outputLabel.text = text
    }
}

