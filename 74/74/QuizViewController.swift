//
//  ViewController.swift
//  74
//
//  Created by 築山朋紀 on 2019/04/09.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    //問題文を格納する配列
    var guizArray = [Any]()
    
    //正解数
    var correctAnswer = 0
    
    //クイズを表示するTextView
    @IBOutlet var guizTextView: UILabel!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: Button!
    @IBOutlet var choiceButton2: Button!
    @IBOutlet var choiceButton3: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一時的にクイズを格納しておく配列
        var tmpArray = [Any]()
        
        //tmpArrayに問題文、3つの選択肢、答えが入った配列を追加していく
        tmpArray.append(["1989年に「平成」の元号となりましたが、この時元号を発表した官房長官は誰でしょう？","竹下登","小渕恵三","菅義偉",2])
        tmpArray.append(["平成元年に起こった出来事として当てはまるのはどれ？","ソ連崩壊","ベルリンの壁崩壊","バブル崩壊",2])
        tmpArray.append(["平成元年に消費税3%が始まりましたが、何月から始まったのか？","4月","8月","12月",1])
        tmpArray.append(["消費税率が5%に引き上がった時に総理大臣を務めていたのは誰でしょう？？","安倍晋三","橋本龍太郎","竹下登",2])
        tmpArray.append(["長野オリンピックが開催されたのは何年でしょう？", "平成元年", "平成10年", "平成20年", 2])
        tmpArray.append(["長野オリンピックにおいて日本の金メダル獲得数は？", "1個", "5個", "334個", 2])
        tmpArray.append(["平成の女性アイドルグループの先駆けとなった「モーニング娘。」ですが、彼女たちがデビューするに至ったオーディション番組といえば？", "ASAYAN", "HIRUYAN", "YORUYAN", 1])
        tmpArray.append(["デビュー時のモーニング娘。の人数は？", "2人", "5人", "48人", 2])
        tmpArray.append(["今や国民の誰もが魅了されているサッカーですが、日本でプロサッカーリーグ(Jリーグ)が創立されたのは何年でしょうか？", "平成3年", "平成15年", "平成31年", 1])
        tmpArray.append(["平成10年夏の高校野球甲子園大会で、「平成の怪物」という名前を轟かせた選手は誰でしょうか？", "藤川球児", "松坂大輔", "イチロー", 2])
        tmpArray.append(["1990年代から徐々に知名度を上げていき現在も人気がある台湾発祥の飲料とは？", "タピオカ", "チャイ", "スムージー", 1])
        tmpArray.append(["ミステリー漫画をドラマ化したもので初代主人公を堂本剛さんが演じ大ヒットとなり、その後も四代に渡ってジャニーズ事務所所属タレントが主演を務めたドラマとは？", "名探偵コナン", "金田一少年の事件某", "探偵ガリレオ", 2])
        
        //問題文をシャッフルしてquizArrayに格納する
        while (tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            guizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        choiceQuiz()
        
        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        
        //一時的にクイズを取り出す配列
        let tmpArray = guizArray[0] as! [Any]
        
        //問題文のテキストを表示
        guizTextView.text = tmpArray[0] as! String
        
        //選択肢ボタンにそれぞれ選択肢のテキストをセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    //ボタンをおした時
    @IBAction func choiceAnswer(sender: UIButton) {
        
        let tmpArray = guizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag {
            
            //正解数を増やす
            correctAnswer = correctAnswer + 1
        }
        
        //解いた問題をguizArrayから取り除く
        guizArray.remove(at: 0)
        
        //解いた問題数の合計があらかじめ設定していた問題数に達成したら結果画面へ
        if guizArray.count == 0 {
            performSefueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSefueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }
}



class Button: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    private func setUp() {
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 4
    }
}
