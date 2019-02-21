//
//  ViewController.swift
//  27
//
//  Created by 築山朋紀 on 2019/02/21.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    
    private var alphabet = [String]()
    private let text = "`~,<.>;:/?[{]}=+-_!@#$%^&*()qwertyuiopasdfghjklzxcvbnm"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in text.characters {
            alphabet.append(String(i))
        }
    }

    @IBAction private func action() {
        var password = ""
        for _ in 0...30 {
            let hoge = alphabet[Int.random(in: 0...alphabet.count - 1)]
            password += hoge
            print(password)
        }
        label.text = password
        print(password)
    }
}

