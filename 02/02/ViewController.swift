//
//  ViewController.swift
//  02
//
//  Created by 築山朋紀 on 2019/01/27.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

extension UIButton {
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var button1: UIButton!
    @IBOutlet private weak var button2: UIButton!
    @IBOutlet private weak var button3: UIButton!
    @IBOutlet private weak var button4: UIButton!
    @IBOutlet private weak var button5: UIButton!
    @IBOutlet private weak var button6: UIButton!
    @IBOutlet private weak var button7: UIButton!
    @IBOutlet private weak var button8: UIButton!
    @IBOutlet private weak var button9: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

