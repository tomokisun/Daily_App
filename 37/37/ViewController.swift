//
//  ViewController.swift
//  37
//
//  Created by 築山朋紀 on 2019/03/03.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}

class ViewController: UIViewController {
    /// images/13
    private let baseURL = "https://%e8%b5%b7%e3%81%8d%e7%ab%b9%e5%9f%8e.jp/images/"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func action() {
        let index = Int.random(in: 0...13)
        guard let url = URL(string: "twitter://post?message=%e8%b5%b7%e3%81%8d%e7%ab%b9%e5%9f%8e%0A\(baseURL)\(index)") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

