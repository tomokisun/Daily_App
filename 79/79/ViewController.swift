//
//  ViewController.swift
//  79
//
//  Created by 築山朋紀 on 2019/04/14.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}


class SecondViewController: UIViewController {
    @IBOutlet private weak var titleTextInput: UITextField!
    @IBOutlet private weak var dateTextInput: UITextField!
    
    @IBAction private func didButtonTappend(_ sender: UIButton) {
        let title = titleTextInput.text!
        let date = dateTextInput.text!
        
        if !title.isEmpty, !date.isEmpty {
            print(title, date)
        }
    }
}
