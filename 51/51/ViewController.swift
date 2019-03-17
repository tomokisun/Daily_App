//
//  ViewController.swift
//  51
//
//  Created by 築山朋紀 on 2019/03/17.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var timer = Timer()
    private var images = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append(UIImage(named: "1"))
        images.append(UIImage(named: "2"))
        images.append(UIImage(named: "3"))
        images.append(UIImage(named: "4"))
        
        startTimer()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 0.5,
                target: self,
                selector: #selector(self.petalMake),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    @objc func petalMake( ){
        //ランダムなx座標を取り、花びらを作る
        let x:Int = Int(UIScreen.main.bounds.size.width)
        let num = Int(arc4random_uniform(UInt32(x)))
        let petalImg = UIImageView(frame: CGRect(x: CGFloat(num), y: 0, width: 20, height: 30))
        let number = Int.random(in: 0...images.count - 1)
        petalImg.image = images[number]
        self.view.addSubview(petalImg)
        //花びらを降らす関数を呼ぶ
        startFall(petalImg)
    }
    
    func startFall(_ petal: UIImageView) {
        var point = petal.center
        UIView.animate(withDuration: 0.01, delay: 0, options: .curveEaseInOut, animations: { () -> Void in
            //下向きに落ちていく
            point.y += 1
            
            //一定距離ごとに左右に揺れる
            if point.y.truncatingRemainder(dividingBy: 100) <= 25 {
                point.x += 1
            } else if point.y.truncatingRemainder(dividingBy: 100) <= 50 {
                point.x -= 1
            }
            
            petal.center = point
            
        }) { (finished:Bool) -> Void in
            
            //画面の一番下まで来たら花びらを消す
            if point.y >= UIScreen.main.bounds.size.height{
                
                petal.removeFromSuperview()
                
                //花びらを作る関数を呼ぶ
                self.petalMake()
                
            } else {
                
                //まだ画面途中なら降らすアニメーションを行う
                self.startFall(petal)
            }
        }
    }
}

