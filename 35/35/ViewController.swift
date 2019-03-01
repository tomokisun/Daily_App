//
//  ViewController.swift
//  35
//
//  Created by 築山朋紀 on 2019/03/01.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction private func action() {
        guard let url = URL(string: "twitter://post?message=%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E5%AE%8C%E5%85%A8%E3%81%AB%E7%90%86%E8%A7%A3%E3%81%97%E3%81%9F") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

}

