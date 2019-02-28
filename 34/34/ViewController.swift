//
//  ViewController.swift
//  34
//
//  Created by 築山朋紀 on 2019/02/28.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let lunch = ["天ぷら かねき", "Anchor Point (アンカー ポイント)｜赤坂 ステーキ ディナー 二次会 結婚式/永田町 ランチ", "アジアンビストロ Dai 東京ガーデンテラス店", "蒼天", "中華料理 上海大飯店"]
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func action() {
        label.text = lunch[Int.random(in: 0...lunch.count - 1)]
    }

}

