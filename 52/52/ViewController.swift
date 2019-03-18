//
//  ViewController.swift
//  52
//
//  Created by 築山朋紀 on 2019/03/18.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import SwiftyGif

let gifModel: [GifModel] = [
    GifModel(name: "💩カウンター", gifURL: "https://user-images.githubusercontent.com/28350464/51783117-7db02a00-2178-11e9-8974-72451a913682.gif", description: "Map上に、どこで、何月何時何分に💩をしたか記録できます。\n総💩数も見れます。便利ですね()"),
    GifModel(name: "⭕❌ゲーム", gifURL: "https://user-images.githubusercontent.com/28350464/51801611-91948280-2283-11e9-8c8e-e530289e55d8.gif", description: "新幹線の中で全力コーディングしましたので、コードは汚いです。\n2日目にして、絶望を感じてます。"),
    GifModel(name: "カウントアプリ", gifURL: "https://user-images.githubusercontent.com/28350464/51840725-282e7580-2350-11e9-8b19-321686e2fec3.gif", description: "何か数を数えるときにでも使えますね（）"),
    GifModel(name: "計算機", gifURL: "https://user-images.githubusercontent.com/28350464/51911226-a0f70580-2414-11e9-8068-133e5934f5e0.gif", description: "計算出来ます。"),
    GifModel(name: "Todoアプリ", gifURL: "https://user-images.githubusercontent.com/28350464/51983633-8e480380-24dc-11e9-85b5-b26aeac975e8.gif", description: "Todoアプリのリクエストがあったので作りました。"),
    GifModel(name: "オカン送り迎えアプリ", gifURL: "https://user-images.githubusercontent.com/28350464/52047287-0588a080-258c-11e9-8842-66c491d9e683.gif", description: "オカンとの親密な信頼関係があればボタンひとつで迎えに来てくれるでしょう。多分。知らんけど。"),
    GifModel(name: "ズボラ出願", gifURL: "https://user-images.githubusercontent.com/28350464/52129438-dbfa7280-267a-11e9-8380-58c9771e0a0d.gif", description: "センター試験の点数を入力すると最適な大学と学部を教えてくれます。"),
    GifModel(name: "ダブル計算機", gifURL: "https://user-images.githubusercontent.com/28350464/52177702-6b815c00-2808-11e9-974f-d013440b88b8.gif", description: "横に計算機が2つ並ぶので同時に計算するときに便利です。"),
    GifModel(name: "お友達メーカー", gifURL: "https://user-images.githubusercontent.com/28350464/52215192-de590880-28d6-11e9-9b7a-e9f087da41a3.gif", description: "名前も内容も適当です。"),
    GifModel(name: "メモ帳", gifURL: "https://user-images.githubusercontent.com/28350464/52247149-12124d80-292c-11e9-8a57-9e88db40c537.gif", description: "タスクアプリを拡張しました。"),
    GifModel(name: "桜を散らしてみた", gifURL: "https://user-images.githubusercontent.com/28350464/54492287-81eefd00-4908-11e9-8168-6d11baeecf99.gif", description: "そろそろ桜の季節が近づいてきたので、桜を散らしてみた"),
    GifModel(name: "ニコ動のコメント", gifURL: "https://user-images.githubusercontent.com/28350464/54476681-a1702200-4843-11e9-9d60-35418174b912.gif", description: "ニコニコ動画のコメントが流れてくるやつ作ってみた"),
    GifModel(name: "カラースライダー", gifURL: "https://user-images.githubusercontent.com/28350464/54364896-2c6ce300-46b1-11e9-9a15-d3a6b031367e.gif", description: ""),
    GifModel(name: "何時に起きる？", gifURL: "https://user-images.githubusercontent.com/28350464/54086462-0aabed00-438d-11e9-8e30-45f0bff5a82d.gif", description: "何時に起きれば予定に間に合うのか計算出来ない人のために、朝起きてから最寄り駅まで何分掛かるのか計算してくれるアプリを作った"),
    GifModel(name: "無限アラート", gifURL: "https://user-images.githubusercontent.com/28350464/54070769-9b100200-42a7-11e9-8b4a-994be8514e33.gif", description: "今流行の無限アラート作った"),
    GifModel(name: "起き竹城のアプリ", gifURL: "https://user-images.githubusercontent.com/28350464/53695536-39abe700-3e00-11e9-8393-dceac4c25830.gif", description: "起き竹城をiOSアプリ版を勝手に作りました。"),
    GifModel(name: "パスワード生成アプリ", gifURL: "https://user-images.githubusercontent.com/28350464/53168935-3ace5e80-361f-11e9-8d4b-f0e513ac2391.gif", description: ""),
]

class ViewController: UIViewController {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func action() {
        let item = gifModel[Int.random(in: 0...gifModel.count - 1)]
        nameLabel.text = item.name
        let url = URL(string: item.gifURL)
        imageView.setGifFromURL(url)
        descriptionLabel.text = item.description
    }
}

struct GifModel {
    let name: String
    let gifURL: String
    let description: String
    
    init(name: String, gifURL: String, description: String) {
        self.name = name
        self.gifURL = gifURL
        self.description = description
    }
}

