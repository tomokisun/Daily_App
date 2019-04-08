//
//  ViewController.swift
//  73
//
//  Created by 築山朋紀 on 2019/04/08.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!
    private var timer = Timer()
    private var count = 600
    private var image: UIImage? {
        return images[Int.random(in: 0...images.count - 1)]
    }
    
    private var images = [UIImage?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        images.append(UIImage(named: "1"))
        images.append(UIImage(named: "2"))
        images.append(UIImage(named: "3"))
        images.append(UIImage(named: "4"))
        images.append(UIImage(named: "5"))
        images.append(UIImage(named: "6"))
        images.append(UIImage(named: "7"))
        images.append(UIImage(named: "8"))
        images.append(UIImage(named: "9"))
        images.append(UIImage(named: "10"))
        images.append(UIImage(named: "11"))
        images.append(UIImage(named: "12"))
        images.append(UIImage(named: "13"))
        images.append(UIImage(named: "14"))
        images.append(UIImage(named: "15"))
        
        startTimer()
        imageView.image = image
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(self.countDown),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    @objc private func countDown() {
        count -= 1
        label.text = toTime(TimeInterval(count))
    }

    @IBAction private func shuffle(_ sender: UIButton) {
        imageView.image = image
        count = 600
    }
    
    private func toTime(_ b: TimeInterval) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .hour, .second]
        return formatter.string(from: b)
    }
}

