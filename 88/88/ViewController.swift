//
//  ViewController.swift
//  88
//
//  Created by 築山朋紀 on 2019/04/23.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

var countString = ""

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var label: UILabel!
    private var timer = Timer()
    private var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
        textField.delegate = self
        startTimer()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(self.appearance),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    @objc private func appearance() {
        count += 1
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            label.text = "\(text.count)文字"
            print("\(text.count)文字")
            countString = "\(text.count)文字"
        }
        if count >= 10 {
            self.performSegue(withIdentifier: "toHoge", sender: nil)
            timer.invalidate()
        }
        return 10 > count
    }
}

class HogeViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = countString
    }
}
