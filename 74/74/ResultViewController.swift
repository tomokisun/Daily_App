//
//  ResultViewController.swift
//  74
//
//  Created by 築山朋紀 on 2019/04/09.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //正解数
    var correctAnswer: Int = 0
    
    //結果を表示するラベル
    @IBOutlet var resultlabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultlabel.text = String(correctAnswer)
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
