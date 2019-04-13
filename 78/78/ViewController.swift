//
//  ViewController.swift
//  78
//
//  Created by 築山朋紀 on 2019/04/13.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class Button: UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                self.setImage(UIImage(named: "mogura_1"), for: .normal)
            } else {
                self.setImage(UIImage(named: "mogura_0"), for: .normal)
            }
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private var buttons: [Button]!
    @IBOutlet private weak var scoreLabel: UILabel!
    private var timer = Timer()
    private var score = 0 {
        didSet {
            scoreLabel.text = "\(score) pt"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in buttons {
            button.addTarget(self, action: #selector(self.buttonTappend), for: .touchUpInside)
        }
        startTimer()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 3,
                target: self,
                selector: #selector(self.appearance),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    //アリを出現させる
    @objc private func appearance() {
        for button in buttons {
            let hoge = Int.random(in: 0...2)
            button.isEnabled = hoge == 0
        }
    }
    
    @objc private func buttonTappend(sender: Button) {
        score += 100
        sender.isEnabled = false
    }
}
