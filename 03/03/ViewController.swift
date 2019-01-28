//
//  ViewController.swift
//  03
//
//  Created by 築山朋紀 on 2019/01/28.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!

    private var count: Int = 0 {
        didSet {
            label.text = String(count)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = String(count)
    }
    
    @IBAction private func countUp() {
        count += 1
    }
}

