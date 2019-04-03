//
//  ViewController.swift
//  68
//
//  Created by 築山朋紀 on 2019/04/03.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

let drink = ["オレンジジュース", "コーラ", "ジンジャーエール", "カルピス", "グレープフルーツジュース", "ぶどうジュース", "レモネード", "烏龍茶", "メロンソーダ", "水", "りんごジュース"]
var number = 0

class ViewController: UIViewController {
    
    private var count = 2 {
        didSet {
            label.text = String(count)
        }
    }
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func countUp() {
        if count >= drink.count {
            return
        }
        count += 1
    }
    
    @IBAction private func countDown() {
        if count <= 2 {
            return
        }
        count -= 1
    }
    
    @IBAction private func nextButtonDidTappend() {
        number = count
    }
}

final class HogeViewController: UIViewController {
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var message = ""
        for _ in 1...number {
            message += drink[Int.random(in: 0...drink.count - 1)]
            message += "\n"
        }
        label.text = message
    }
}
