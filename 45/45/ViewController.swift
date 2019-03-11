//
//  ViewController.swift
//  45
//
//  Created by 築山朋紀 on 2019/03/11.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var baseView: UIView!
    private var imageName = [UIImage?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageName.append(UIImage(named: "1"))
        imageName.append(UIImage(named: "2"))
        imageName.append(UIImage(named: "3"))
        imageName.append(UIImage(named: "4"))
    }
    
    @IBAction private func action() {
        let screenWidth: Int = Int(baseView.frame.width - 60)
        let screenHeight: Int = Int(baseView.frame.height - 32)
        let imageView = UIImageView(image: imageName[Int.random(in: 0...3)])
        let x = Int.random(in: 0...screenWidth)
        let y = Int.random(in: 0...screenHeight)
        imageView.frame = CGRect(x: x, y: y, width: 60, height: 32)
        self.baseView.addSubview(imageView)
    }
}

