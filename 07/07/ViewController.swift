//
//  ViewController.swift
//  07
//
//  Created by 築山朋紀 on 2019/02/01.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var inputField: UITextField!
    @IBOutlet private weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputField.delegate = self
        
    }
    
    private func setLabel(text: String) -> String {
        if text >= "92" {
            return "早稲田大学政治経済学部"
        } else if text >= "91" {
            return "早稲田大学法学部\n早稲田大学商学部"
        } else if text >= "90" {
            return "青山学院大学総合文化政策学部\n青山学院大学国際政治経済学部"
        } else if text >= "86" {
            return "青山学院大学法学部"
        } else if text >= "84" {
            return "法政大学経営学部"
        } else {
            return "法政大学法学部"
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = textField.text!
        self.outputLabel.text = self.setLabel(text: text)
        textField.resignFirstResponder()
        return true
    }
}

