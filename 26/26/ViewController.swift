//
//  ViewController.swift
//  26
//
//  Created by 築山朋紀 on 2019/02/20.
//  Copyright © 2019 tomoki. All rights reserved.
//

//ラジオネームを拝借した
//https://matome.naver.jp/odai/2142219114554934301?&page=1
//https://belcy.jp/72890

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    private var item = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        item.append("ドナルド脱臼")
        item.append("パンツくいcom.com")
        item.append("自慢のパワーで")
        item.append("鳥取の長方形")
        item.append("ボーイフレンドはカブトムシ")
        item.append("半ライス大盛り")
        item.append("ジャムを持参")
        item.append("築5分徒歩3年")
        item.append("いちご100%中の100%")
        item.append("1+2=")
        item.append("人間立体交差点")
        item.append("手羽先コウ")
        item.append("僕の年収は芦田愛菜ちゃんの15分")
        item.append("ハチミツボーイ")
        item.append("後ろ姿は石田純一似")
        item.append("テンガリオン")
        item.append("顔面凶器")
        item.append("黙殺アルマジロ")
        item.append("超スポポビッチ")
        item.append("重いけどかるかん")
    }
    
    @IBAction func action() {
        label.text = "\(item[Int.random(in: 0...item.count - 1)])さん"
    }
}
