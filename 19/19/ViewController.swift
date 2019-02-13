//
//  ViewController.swift
//  19
//
//  Created by 築山朋紀 on 2019/02/13.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var view1: UIView!
    @IBOutlet private weak var view2: UIView!
    @IBOutlet private weak var view3: UIView!
    @IBOutlet private var resultLabel: UILabel!
    
    private var timer: Timer!
    private var score = 1000
    let width = UIScreen.main.bounds.size.width
    private var positionX: [CGFloat] = [0.0, 0.0, 0.0]
    private var dx: [CGFloat] = [1.0, 0.5, -1.0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc private func up() {
        for i in 0..<3 {
            if positionX[i] > width || positionX[i] < 0 {
                dx[i] = dx[i] * (-1)
            }
            positionX[i] += dx[i]
        }
        view1.center.x = positionX[0]
        view2.center.x = positionX[1]
        view3.center.x = positionX[2]
    }
    
    @IBAction private func start(sender: UIButton) {
        score = 1000
        positionX = [width / 2, width / 2, width / 2]
        resultLabel.isHidden = true
        switch sender.tag {
        case 1:
            timer = Timer.scheduledTimer(timeInterval: 0.005, target: self,selector: #selector(self.up), userInfo: nil,repeats: true)
        case 2:
            timer = Timer.scheduledTimer(timeInterval: 0.003, target: self,selector: #selector(self.up), userInfo: nil,repeats: true)
        case 3:
            timer = Timer.scheduledTimer(timeInterval: 0.001, target: self,selector: #selector(self.up), userInfo: nil,repeats: true)
        default:
            break
        }
        timer.fire()
    }
    
    //ストップボタンを押したら
    @IBAction func stop() {
        if timer.isValid == true { //もしタイマーが動いていたら
            timer.invalidate() //タイマーを止める(無効にする)
            
            for i in 0..<3 {
                score = score - abs(Int(width/2 - positionX[i]))*2 //スコアの計算をする
            }
            
            resultLabel.text = "Score : " + String(score) //結果ラベルにスコアを表示させる
            resultLabel.isHidden = false //結果ラベルを隠さない(現す)
        }
    }
    
    @IBAction func toTop() {
        self.dismiss(animated: true, completion: nil)
    }
}

