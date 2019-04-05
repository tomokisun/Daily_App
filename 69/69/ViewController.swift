//
//  ViewController.swift
//  69
//
//  Created by 築山朋紀 on 2019/04/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

enum Arithmetic {
    case plus
    case minus
    case multiply
    case division
}

class ViewController: UIViewController {
    
    private var number1 = 0
    private var number2 = 0
    private var arithmetic: Arithmetic = .plus
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var hogeLabel: UILabel!
    private var hoge = "" {
        didSet {
            hogeLabel.text = hoge
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func clear() {
        number1 = 0
        number1 = 0
        label.text = "0"
    }
    
    @IBAction private func numberTappend(sender: UIButton) {
        number1 = number1 * 10 + sender.tag
        hoge += String(sender.tag)
        label.text = String(number1)
    }
    
    @IBAction private func calculation(sender: UIButton) {
        
        number2 = number1
        number1 = 0
        
        switch sender.tag {
        case 1:
            arithmetic = .plus
            hoge += "+"
        case 2:
            arithmetic = .minus
        case 3:
            arithmetic = .multiply
        case 4:
            arithmetic = .division
        default:
            break
        }
    }
    
    @IBAction private func equal() {
        var num = 0
        
        switch arithmetic {
        case .plus:
            num = number2 + number1
        case .minus:
            num = number2 - number1
        case .multiply:
            num = number2 * number1
        case .division:
            num = number2 / number1
        }
        label.text = String(num)
    }
}

extension UIButton {
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = rect.height / 2
        self.clipsToBounds = true
    }
}
