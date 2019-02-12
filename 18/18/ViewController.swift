//
//  ViewController.swift
//  18
//
//  Created by 築山朋紀 on 2019/02/12.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

/// まあ、二年前に作ったコピペなんだけどｗｗｗｗｗｗｗ

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var count: Float = 0.0
    var timer: Timer = Timer()
    
    @IBOutlet var hantei: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func start() {
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(
                timeInterval: 0.0053,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
            hantei.text = " "
        }
    }
    
    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
            //hanteiメソッドの呼び出し、結果を表示する
            self.hantai()
        }
    }
    
    @IBAction func reset() {
        count = count * 0.00
        if count == 0.00 {
            label.text = "0.00"
            hantei.text = "　　 "
        }
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
            //タイマーの動作が停止したら表示が0.00になる
            label.text = "0.00"
        }
    }
    
    @objc func up() {
        //countを0.01 (時間超過分)足す
        count = count + 0.01
        //ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }
    
    func hantai() {
        if count > 9.80 && count < 10.20 {
            hantei.text = "PERFECT!"
        }else if count > 9.70 && count < 10.30 {
            hantei.text = "GREAT"
        }else if count > 9.50 && count < 10.50 {
            hantei.text = "GOOD"
        }else {
            hantei.text = "BAD"
        }
    }
}


