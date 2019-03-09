//
//  ViewController.swift
//  43
//
//  Created by 築山朋紀 on 2019/03/09.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showAlert()
    }

    private func showAlert() {
        let body = """
        ∧_∧　ババババ
        （ ・ω・)=つ≡つ
        （っ ≡つ=つ
        `/　　)
        (ノΠＵ
        何回閉じても無駄ですよ?ww
        m9（＾Д＾）プギャー！！
        """
        let alert = UIAlertController(title: "", message: body, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.showAlert()
        }
        alert.addAction(OKAction)
        self.present(alert, animated: true)
    }
}

