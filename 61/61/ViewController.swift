//
//  ViewController.swift
//  61
//
//  Created by 築山朋紀 on 2019/03/27.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class Hoge {
    var image: UIImage?
    var tag: Int
    
    init(image: UIImage?, tag: Int) {
        self.image = image
        self.tag = tag
    }
}

final class Button: UIButton {
    private var images = [Hoge]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        images.append(Hoge(image: UIImage(named: "1"), tag: 1))
        images.append(Hoge(image: UIImage(named: "2"), tag: 1))
        images.append(Hoge(image: UIImage(named: "3"), tag: 1))
        images.append(Hoge(image: UIImage(named: "4"), tag: 1))
        images.append(Hoge(image: UIImage(named: "5"), tag: 2))
        images.append(Hoge(image: UIImage(named: "6"), tag: 2))
        images.append(Hoge(image: UIImage(named: "7"), tag: 2))
        images.append(Hoge(image: UIImage(named: "8"), tag: 2))
        images.append(Hoge(image: UIImage(named: "9"), tag: 2))
        images.append(Hoge(image: UIImage(named: "10"), tag: 2))
        images.append(Hoge(image: UIImage(named: "11"), tag: 2))
        images.append(Hoge(image: UIImage(named: "12"), tag: 2))
        images.append(Hoge(image: UIImage(named: "13"), tag: 2))
        
        let random = Int.random(in: 0...images.count - 1)
        self.setImage(images[random].image, for: .normal)
        self.tag = images[random].tag
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var label: UILabel!
    private var timer = Timer()
    private var score = 0 {
        didSet {
            label.text = String(score)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startTimer()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 3.0,
                target: self,
                selector: #selector(hoge),
                userInfo: nil,
                repeats: true)
        }
    }
    
    @objc private func hoge() {
        let random = Int.random(in: 0...6)
        for _ in 0...random {
            let button = Button()
            button.sizeToFit()
            let screenWidth: Int = Int(baseView.frame.width - 100)
            let screenHeight: Int = Int(baseView.frame.height - 100)
            let x = Int.random(in: 0...screenWidth)
            let y = Int.random(in: 0...screenHeight)
            button.frame = CGRect(x: x, y: y, width: 100, height: 100)
            button.imageView?.contentMode = .scaleAspectFill
            button.addTarget(self, action: #selector(buttonTappend), for: .touchUpInside)
            self.baseView.addSubview(button)
        }
    }
    
    @objc private func buttonTappend(_ sender: UIButton) {
        sender.removeFromSuperview()
        if sender.tag == 1 {
            self.score += 100
        } else {
            self.score -= 500
        }
    }
}
