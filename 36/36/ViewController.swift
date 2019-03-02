//
//  ViewController.swift
//  36
//
//  Created by 築山朋紀 on 2019/03/02.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    private var ideas = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ideas.append("パンツを売るRPGs")
        ideas.append("オンラインサロンを知った法政大学の大学生の単位取得RPG")
        ideas.append("高校生社長tik(攻め)tok(受け)シューティングゲーム")
        ideas.append("feedlyの上位互換RSS")
        ideas.append("ADHD体験アプリ")
        ideas.append("よくあるゲームアプリのように、ログインするとボーナスとして、ゲーム内通貨やダイヤのようなアイテムがもらえるが、ただ貯めるだけのアプリ")
        ideas.append("血便ハンター")
        ideas.append("頻尿ハンター")
        ideas.append("その日のレース予想してレース前にシミュレーションできる")
        ideas.append("「ツイ廃予防」\nツイッターを開いたら家に爆弾が打ち込まれる")
        ideas.append("「風俗検索」\n駅名を入力したらおすすめ風俗をレコメンド")
        ideas.append("水曜日のダウンタウンの時間になると教えてくれるアプリ")
        ideas.append("プログラマーがスマホでコーディングする用のキーボードアプリ（適当なので、スルーでも良きです）")
        ideas.append("設定した通知が忘れた頃にやってくるだけのアプリ")
        ideas.append("眠気を覚ます\nとにかくクソでかいアラート音が鳴る")
        ideas.append("乳首をタップすると喘ぎ声が出る イかせたら勝ち")
        ideas.append("右手を止めるな！！\n精子が飛び出るまでおちんちんをタップし続ける。そう、右手で")
    }
    
    @IBAction private func action() {
        label.text = ideas[Int.random(in: 0...ideas.count - 1)]
    }
}
