//
//  ViewController.swift
//  63
//
//  Created by 築山朋紀 on 2019/03/29.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    private var images = [UIImage?]()
    private var timer = Timer()
    let animationDuration: TimeInterval = 1
    let switchingInterval: TimeInterval = 3

    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append(UIImage(named: "IMG_8962"))
        images.append(UIImage(named: "IMG_8963"))
        images.append(UIImage(named: "IMG_8964"))
        images.append(UIImage(named: "IMG_8965"))
        images.append(UIImage(named: "IMG_8966"))
        images.append(UIImage(named: "IMG_8967"))
        images.append(UIImage(named: "IMG_8968"))
        images.append(UIImage(named: "IMG_8969"))
        images.append(UIImage(named: "IMG_8970"))
        images.append(UIImage(named: "IMG_8971"))
        images.append(UIImage(named: "IMG_8972"))
        images.append(UIImage(named: "IMG_8973"))
        images.append(UIImage(named: "IMG_8974"))
        images.append(UIImage(named: "IMG_8975"))
        images.append(UIImage(named: "IMG_8976"))
        images.append(UIImage(named: "IMG_8977"))
        images.append(UIImage(named: "IMG_8978"))
        images.append(UIImage(named: "IMG_8979"))
        images.append(UIImage(named: "IMG_8980"))
        images.append(UIImage(named: "IMG_8981"))
        images.append(UIImage(named: "IMG_8982"))
        images.append(UIImage(named: "IMG_8983"))
        images.append(UIImage(named: "IMG_8984"))
        images.append(UIImage(named: "IMG_8985"))
        images.append(UIImage(named: "IMG_8986"))
        images.append(UIImage(named: "IMG_8987"))
        images.append(UIImage(named: "IMG_8988"))
        images.append(UIImage(named: "IMG_8999"))
        
        startTimer()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 3.0,
                target: self,
                selector: #selector(hoge),
                userInfo: nil,
                repeats: true)
        }
    }
    
    @objc private func hoge() {
        let random = Int.random(in: 0...images.count - 1)
        imageView.image = images[random]
    }
}

