//
//  ViewController.swift
//  28
//
//  Created by 築山朋紀 on 2019/02/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import PKHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func tweetAction() {
        HUD.show(.error)
    }

}

