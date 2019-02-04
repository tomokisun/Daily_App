//
//  ViewController.swift
//  10
//
//  Created by 築山朋紀 on 2019/02/04.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    
    var users = [UserModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        users.append(UserModel(name: "たかぎ", image: UIImage(named: "yHjzBLAY_400x400")))
        users.append(UserModel(name: "まさみつ", image: UIImage(named: "JurekDn4_400x400")))
        users.append(UserModel(name: "だいゆう", image: UIImage(named: "U3Wj3UW__400x400")))
        users.append(UserModel(name: "カフェイン", image: UIImage(named: "AoEJljP__400x400")))
        users.append(UserModel(name: "おはい(メンヘラ)", image: UIImage(named: "RGPq_I0u_400x400")))
        users.append(UserModel(name: "yoshiya", image: UIImage(named: "PSkuoedu_400x400")))
        users.append(UserModel(name: "『ほくとん』", image: UIImage(named: "m20lD7b4_400x400")))
        users.append(UserModel(name: "藤尾 伸也", image: UIImage(named: "NHWaMIQe_400x400")))
        users.append(UserModel(name: "さとぽん ", image: UIImage(named: "g1zJM-Ay_400x400")))
        users.append(UserModel(name: "Aoki Riku", image: UIImage(named: "9jW0Qf16_400x400")))
    }
    
    @IBAction private func nextAction() {
        let random = Int.random(in: 0 ... users.count - 1)
        label.text = "\(users[random].name)が現れた！"
        imageView.image = users[random].image
    }
}

class UserModel {
    let name: String
    let image: UIImage?
    
    init(name: String, image: UIImage?) {
        self.name = name
        self.image = image
    }
}
