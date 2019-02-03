//
//  ViewController.swift
//  09
//
//  Created by 築山朋紀 on 2019/02/03.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var calculatorView1: CalculatorView!
    private var calculatorView2: CalculatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calculatorView1 = UINib.init(nibName: "CalculatorView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? CalculatorView
        calculatorView2 = UINib.init(nibName: "CalculatorView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as? CalculatorView

        view.addSubview(calculatorView1)
        view.addSubview(calculatorView2)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        calculatorView1.frame = CGRect(x: 0, y: 0, width: view.frame.width / 2 - 1, height: view.frame.height)
        calculatorView2.frame = CGRect(x: view.frame.width / 2 + 1, y: 0, width: view.frame.width / 2 - 1, height: view.frame.height)
    }
}

