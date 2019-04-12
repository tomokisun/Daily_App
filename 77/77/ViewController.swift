//
//  ViewController.swift
//  77
//
//  Created by 築山朋紀 on 2019/04/12.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var incomeInputField: UITextField!
    @IBOutlet private weak var foodInputField: UITextField!
    @IBOutlet private weak var educationInputField: UITextField!
    @IBOutlet private weak var clothesInputField: UITextField!
    @IBOutlet private weak var entertainmentInputField: UITextField!
    @IBOutlet private weak var moneyTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func returnMoney() -> Int {
        var 収入: Int {
            let string = incomeInputField.text!
            return Int(string) ?? 0
        }
        var 飲食費: Int {
            let string = foodInputField.text!
            return Int(string) ?? 0
        }
        var 教育費: Int {
            let string = educationInputField.text!
            return Int(string) ?? 0
        }
        var 衣服費: Int {
            let string = clothesInputField.text!
            return Int(string) ?? 0
        }
        var 交際費: Int {
            let string = entertainmentInputField.text!
            return Int(string) ?? 0
        }
        return 収入 - (飲食費 + 教育費 + 衣服費 + 交際費)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        moneyTextField.text = String(returnMoney())
        return true
    }
}
