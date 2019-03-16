//
//  ViewController.swift
//  50
//
//  Created by 築山朋紀 on 2019/03/16.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func comment(_ textField: UITextField) {
        let label = UILabel()
        guard let text = textField.text else { return }
        label.text = text
        let screenHeight: Int = Int(baseView.frame.height - 30)
        let screenWidth: Int = Int(baseView.frame.width)
        let y = Int.random(in: 0...screenHeight)
        label.frame = CGRect(x: screenWidth, y: y, width: 0, height: 0)
        label.sizeToFit()
        baseView.addSubview(label)
        UIView.animate(withDuration: 5.0, animations: {
            label.frame.origin.x = -20 - label.frame.width
        }) { _ in
            label.removeFromSuperview()
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        comment(textField)
        return true
    }
}
