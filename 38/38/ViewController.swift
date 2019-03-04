//
//  ViewController.swift
//  38
//
//  Created by 築山朋紀 on 2019/03/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction private func action() {
        guard let url = URL(string: "twitter://post?message=%E6%9A%87%E3%81%A0") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

