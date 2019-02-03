//
//  CalculatorView.swift
//  09
//
//  Created by 築山朋紀 on 2019/02/03.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class CalculatorView: UIView {

    @IBOutlet private weak var label: UILabel!
    let model = CalculatorModel()
    
    /// ナンバーを入力時
    @IBAction private func numberTappend(sender: UIButton) {
        label.text = model.number(num: sender.tag)
    }

    /// 演算
    @IBAction private func calculation(sender: UIButton) {
        model.calculator(num: sender.tag)
    }
    
    /// 計算
    @IBAction private func equal() {
        label.text = model.equal()
    }
}

extension UIButton {
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = 10
        self.backgroundColor = .darkGray
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 25)
    }
}
