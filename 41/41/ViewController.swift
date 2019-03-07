//
//  ViewController.swift
//  41
//
//  Created by 築山朋紀 on 2019/03/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class PeopleButton: UIButton {
    private var peoples = [UIImage?]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        peoples.append(UIImage(named: "animal_mogura_kouji2"))
        peoples.append(UIImage(named: "animal_mogura_kouji2"))
        
        let people = peoples[Int.random(in: 0...peoples.count - 1)]
        self.setImage(people, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var baseView: UIView!
    private var timer = Timer()
    private var count = 3.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        appearance()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: count,
                target: self,
                selector: #selector(self.appearance),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    //アリを出現させる
    @objc private func appearance() {
        let screenWidth: Int = Int(baseView.frame.width - 50)
        let screenHeight: Int = Int(baseView.frame.height - 50)
        let random = Int.random(in: 1...10)
        for _ in 0...random {
            let button = PeopleButton()
            let x = Int.random(in: 0...screenWidth)
            let y = Int.random(in: 0...screenHeight)
            button.frame = CGRect(x: x, y: y, width: 50, height: 50)
            button.addTarget(self, action: #selector(self.buttonTappend), for: .touchUpInside)
            self.baseView.addSubview(button)
        }
    }
    
    @objc private func buttonTappend(sender: PeopleButton) {
        sender.removeFromSuperview()
    }
}
