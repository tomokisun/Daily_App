//
//  ViewController.swift
//  13
//
//  Created by 築山朋紀 on 2019/02/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var playerLabel: UILabel!
    @IBOutlet private weak var partnerLabel: UILabel!
    @IBOutlet private weak var label: UILabel!
    
    private let item = ["👊", "🖐️", "🤘"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func 👊() {
        let hoge = item[Int.random(in: 0 ... item.count - 1)]
        playerLabel.text = "👊"
        partnerLabel.text = hoge
        if hoge == "👊" {
            label.text = "もう一回"
        } else if hoge == "🖐️" {
            label.text = "負け"
        } else {
            label.text = "勝ち"
        }
    }
    
    @IBAction private func 🤘() {
        let hoge = item[Int.random(in: 0 ... item.count - 1)]
        playerLabel.text = "🤘"
        partnerLabel.text = hoge
        if hoge == "👊" {
            label.text = "負け"
        } else if hoge == "🖐️" {
            label.text = "勝ち"
        } else {
            label.text = "もう一回"
        }
    }
    
    @IBAction private func 🖐️() {
        let hoge = item[Int.random(in: 0 ... item.count - 1)]
        playerLabel.text = "🖐️"
        partnerLabel.text = hoge
        if hoge == "👊" {
            label.text = "勝ち"
        } else if hoge == "🖐️" {
            label.text = "もう一回"
        } else {
            label.text = "負け"
        }
    }
    
    
}

