//
//  ViewController.swift
//  66
//
//  Created by 築山朋紀 on 2019/04/01.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var baseView: UIView! {
        didSet {
            baseView.layer.cornerRadius = 4
            baseView.layer.borderWidth = 1
            baseView.layer.borderColor = UIColor.black.cgColor
        }
    }
    @IBOutlet private weak var button: UIButton! {
        didSet {
            button.setImage(UIImage(named: "Artboard_on"), for: .highlighted)
            button.setImage(UIImage(named: "Artboard_off"), for: .normal)
        }
    }
    
    private var count = 0 {
        didSet {
            label.text = String(count)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction private func tap() {
        count += 1
    }
}

