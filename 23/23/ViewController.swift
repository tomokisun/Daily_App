//
//  ViewController.swift
//  23
//
//  Created by 築山朋紀 on 2019/02/17.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class PeopleImage {
    var tag: Int
    var image: UIImage?
    
    init(tag: Int, image: UIImage?) {
        self.tag = tag
        self.image = image
    }
}

class PeopleButton: UIButton {
    private var peoples = [PeopleImage]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        peoples.append(PeopleImage(tag: 1, image: UIImage(named: "kyuryou_syoninkyu_man")))
        peoples.append(PeopleImage(tag: 1, image: UIImage(named: "kyuryou_syoninkyu_woman")))
        peoples.append(PeopleImage(tag: 1, image: UIImage(named: "live_music_ouen_man")))
        peoples.append(PeopleImage(tag: 1, image: UIImage(named: "live_music_ouen_woman")))
        peoples.append(PeopleImage(tag: 2, image: UIImage(named: "menhera_man")))
        peoples.append(PeopleImage(tag: 2, image: UIImage(named: "menhera_woman")))
        peoples.append(PeopleImage(tag: 2, image: UIImage(named: "menhera_man")))
        peoples.append(PeopleImage(tag: 2, image: UIImage(named: "menhera_woman")))
        
        let people = peoples[Int.random(in: 0...peoples.count - 1)]
        self.setImage(people.image, for: .normal)
        self.tag = people.tag
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var scoreLabel: UILabel!
    private var timer = Timer()
    private var time = 0 {
        didSet {
            if time >= 30 {
                self.gameEnd()
            }
        }
    }
    private var score = 0 {
        didSet {
            scoreLabel.text = String(score)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startTimer()
        appearance()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 5.0,
                target: self,
                selector: #selector(self.appearance),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    //人間を出現させる
    @objc private func appearance() {
        time += 5
        let screenWidth: Int = Int(baseView.frame.width - 50)
        let screenHeight: Int = Int(baseView.frame.height - 50)
        for _ in 0...5 {
            let button = PeopleButton()
            let x = Int.random(in: 0...screenWidth)
            let y = Int.random(in: 0...screenHeight)
            button.frame = CGRect(x: x, y: y, width: 50, height: 50)
            button.addTarget(self, action: #selector(self.buttonTappend), for: .touchUpInside)
            self.baseView.addSubview(button)
        }
    }
    
    @objc private func buttonTappend(sender: PeopleButton) {
        if sender.tag == 1 {
            // normal
            score -= 500
        } else {
            // メンヘラ
            score += 100
        }
        sender.removeFromSuperview()
    }
    
    private func gameEnd() {
        if timer.isValid {
            timer.invalidate()
        }
        let target = GameEndViewController(score: self.score)
        navigationController?.pushViewController(target, animated: true)
        
    }
}

