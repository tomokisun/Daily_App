//
//  ViewController.swift
//  25
//
//  Created by 築山朋紀 on 2019/02/19.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var questionArray = [Any]()
    @IBOutlet private weak var questionTextView: UITextView!
    @IBOutlet private weak var choiceButton1: UIButton!
    @IBOutlet private weak var choiceButton2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [Any]()
        tmpArray.append(["眠気はありますか？", "ある", "ない"])
        tmpArray.append(["体は痛いですか？", "はい", "いいえ"])
        tmpArray.append(["やる気が出ないですか？", "はい", "いいえ"])
        tmpArray.append(["キレそうになりますか？", "はい", "いいえ"])
        tmpArray.append(["不安にかられますか？", "はい", "いいえ"])
        
        while (tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            questionArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        
        choiceQuiz()
    }
    
    func choiceQuiz() {
        
        //一時的にクイズを取り出す配列
        let tmpArray = questionArray[0] as! [Any]
        
        //問題文のテキストを表示
        questionTextView.text = tmpArray[0] as! String
        
        //選択肢ボタンにそれぞれ選択肢のテキストをセット
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer() {
        questionArray.remove(at: 0)
        if questionArray.count == 0 {
            self.performSegue(withIdentifier: "to", sender: nil)
        } else {
            choiceQuiz()
        }
    }
}

