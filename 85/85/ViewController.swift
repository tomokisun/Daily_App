//
//  ViewController.swift
//  85
//
//  Created by 築山朋紀 on 2019/04/20.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

@IBDesignable
class Button: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 21
        self.layer.masksToBounds = true
    }
}
