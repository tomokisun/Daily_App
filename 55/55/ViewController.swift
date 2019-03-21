//
//  ViewController.swift
//  55
//
//  Created by 築山朋紀 on 2019/03/21.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    private var timer = Timer()
    private var images = [UIImage?]()
    private var isRoulette = false {
        didSet {
            if isRoulette {
                label.text = "ストップ"
            } else {
                label.text = "スタート"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append(UIImage(named: "1"))
        images.append(UIImage(named: "2"))
        images.append(UIImage(named: "3"))
        images.append(UIImage(named: "4"))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        defer { isRoulette.toggle() }
        if isRoulette {
            if timer.isValid {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.timer.invalidate()
                }
            }
        } else {
            if !timer.isValid {
                self.startTimer()
            }
        }
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(self.countUp),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    @objc private func countUp() {
        imageView.image = images[Int.random(in: 0...images.count - 1)]
    }
}
