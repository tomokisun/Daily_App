//
//  ViewController.swift
//  71
//
//  Created by 築山朋紀 on 2019/04/06.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var headerImageView: UIImageView!
    @IBOutlet private weak var musicIImageView: UIImageView!
    @IBOutlet private weak var baseView: UIView! {
        didSet {
            let blurEffect = UIBlurEffect(style: .light)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = baseView.frame
            baseView.addSubview(visualEffectView)
        }
    }
    @IBOutlet private weak var musicNameLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

