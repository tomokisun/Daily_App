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
    @IBOutlet var guizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //一時的にクイズを格納しておく配列
        var tmpArray = [Any]()
        
        //tmpArrayに問題文、3つの選択肢、答えが入った配列を追加していく
        tmpArray.append(["初代Appleがリリースされたのは","1976年","1970年","1977年",1])
        tmpArray.append(["iPhoneが世界で初めて発売されたのはいつ？","2006年6月","2007年6月","2008年6月",2])
        tmpArray.append(["カメラにフラッシュ機能が導入されるようになったのはどのiPhone？","iPhone5","iPhone3GS","iPhone4",3])
        tmpArray.append(["Siriの声は誰？","マイリー・フラナガン","モーガン・フリーマン","スーザン・ベネット",3])
        tmpArray.append(["PCのデザイン性向上のために、同社が取り入れたのは、どんなデザインの概念？","ファッションデザイン","建築デザイン","プロダクトデザイン",3])
        tmpArray.append(["Appleの本社はどこ？","東京","ニューヨーク","カリフォルニア",3])
        tmpArray.append(["Appleの製品で実際にはないものはどれ？","iPod","iPad","iPed",3])
        tmpArray.append(["Appleが自社で開発したプロセッサの名称は？","A2","A4","A6",2])
        tmpArray.append(["Apple Storeで本当にあった出来事は次のうちどれ？","出産","葬儀","結婚式",3])
        tmpArray.append(["Appleの元CEO「スティーブ・ジョブズ」の正しいスペルはどれ？","Steeves jobs","Steve jobs","Steave jobz",2])
        tmpArray.append(["「Apple」は日本語で何を表す？","梨","林檎","柚子",2])
        tmpArray.append(["MacPro通称ゴミ箱にはThunderbolt2が何個付いている？","5個","6個","7個",2])
        tmpArray.append(["macPro通称ゴミ箱にはUSB3が何個付いている？","4個","6個","8個",1])
        tmpArray.append(["この中でモバイルSuicaに対応しているのはどれ？","iPhone6s","Watch Series 2","MacBookPro",2])
        
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

