//
//  ViewController.swift
//  39
//
//  Created by 築山朋紀 on 2019/03/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import FontAwesome_swift

class ViewController: UIViewController {
    
    private var images = [FontAwesome]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append(.heart)
        images.append(.burn)
        images.append(.theaterMasks)
        images.append(.star)
        images.append(.moon)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self.view)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.center = CGPoint(x: location.x, y: location.y)
        imageView.image = UIImage.fontAwesomeIcon(name: images[Int.random(in: 0...images.count - 1)], style: .solid, textColor: .gray, size: CGSize(width: 30, height: 30))
        self.view.addSubview(imageView)
    }
}

