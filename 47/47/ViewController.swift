//
//  ViewController.swift
//  47
//
//  Created by 築山朋紀 on 2019/03/13.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var textField1: UITextField!
    @IBOutlet private weak var textField2: UITextField!
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func action() {
        guard let text1 = textField1.text else { return }
        guard let text2 = textField2.text else { return }
        guard let index1 = Int(text1) else { return }
        guard let index2 = Int(text2) else { return }
        label.text = "\(index2 / index1)円"
    }
}

