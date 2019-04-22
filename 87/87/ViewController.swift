//
//  ViewController.swift
//  87
//
//  Created by 築山朋紀 on 2019/04/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var currntIndex = 0
    @IBOutlet private weak var label1: UILabel!
    @IBOutlet private weak var label2: UILabel!
    @IBOutlet private weak var label3: UILabel!
    @IBOutlet private weak var answerLabel: UILabel!
    @IBOutlet private var buttons: [UIButton]!
    private var numbers = [[Int]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        random()
    }

    private func next() {
        currntIndex += 1
    }
    
    @IBAction private func buttonDidTappned(_ sender: UIButton) {
        switch currntIndex {
        case 0:
            label1.text = String(sender.tag)
        case 1:
            label2.text = String(sender.tag)
        case 2:
            label3.text = String(sender.tag)
            nextButton.isHidden = false
        default:
            break
        }
        next()
    }
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBAction private func nextButtonDidTappend(_ sender: UIButton) {
        random()
        nextButton.isHidden = true
    }
    
    private func random() {
        currntIndex = 0
        label1.text?.removeAll()
        label2.text?.removeAll()
        label3.text?.removeAll()
        guard let number = numbers.randomElement() else { return }
        buttons.enumerated().forEach { button in
            button.element.tag = number[button.offset]
            button.element.setTitle("\(number[button.offset])", for: .normal)
            answerLabel.text = "\(number[6])"
        }
    }
    
    private func setUp() {
        /// 4 * 5 + 2
        numbers.append([2, 4, 5, 6, 3, 9, 22])
        /// 1 * 8 + 1
        numbers.append([1, 3, 4, 5, 6, 8, 9])
        /// 4 * 0 + 1
        numbers.append([1, 2, 4, 0, 6, 8, 1])
        /// 6 * 7 + 5
        numbers.append([2, 3, 5, 6, 7, 0, 47])
    }
}

