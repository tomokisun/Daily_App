//
//  ViewController.swift
//  24
//
//  Created by 築山朋紀 on 2019/02/18.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    private var value = 0 {
        didSet {
            label.text = """
            あなたは毎月
            \(value)円をサブスクしています。
            """
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func switchAction(sender: UISwitch) {
        let price = isTag(sender: sender)
        if sender.isOn {
            value += price
        } else {
            value -= price
        }
    }

    private func isTag(sender: UISwitch) -> Int {
        switch sender.tag {
        case 1:
            return 1200
        case 2:
            return 980
        case 3:
            return 980
        case 4:
            return 400
        case 5:
            return 600
        case 6:
            return 980
        case 7:
            return 1500
        case 8:
            return 1180
        default:
            return 0
        }
    }

}

