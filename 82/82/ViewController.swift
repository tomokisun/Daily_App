//
//  ViewController.swift
//  82
//
//  Created by 築山朋紀 on 2019/04/17.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var hogeLabel: Label!
    @IBOutlet private weak var fugaLabel: Label!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func buttonDidTappend(_ sender: UIButton) {
        let hoge = ["目覚まし時計が", "愛犬", "携帯", "行く気が", "給料が"]
        let fuga = ["鳴らなかった", "風邪", "壊れた", "ない", "なかった"]
        hogeLabel.text = hoge.randomElement()
        fugaLabel.text = fuga.randomElement()
    }
}

@IBDesignable
class Label: UILabel {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

@IBDesignable
class Button: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
