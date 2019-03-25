//
//  ViewController.swift
//  59
//
//  Created by 築山朋紀 on 2019/03/25.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    private let animationView = LOTAnimationView(name: "data")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animationView.frame.size = CGSize(width: 240, height: 240)
        animationView.center = view.center
        animationView.loopAnimation = true
        view.addSubview(animationView)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if animationView.isAnimationPlaying {
            animationView.stop()
        } else {
            animationView.play()
        }
    }
}

