//
//  ViewController.swift
//  12
//
//  Created by 築山朋紀 on 2019/02/06.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label1: UILabel!
    @IBOutlet private weak var label2: UILabel!
    
    private let whoItem = ["友達", "兄弟", "親戚", "宇宙人", "パソコン"]
    private let whyItem = ["風邪", "怪我", "壊れた気持ち", "居なくなったかも", "行きたくない気持ち"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func tappend() {
        label1.text = whoItem[Int.random(in: 0 ... whoItem.count - 1)]
        label2.text = whyItem[Int.random(in: 0 ... whyItem.count - 1)]
    }


}

