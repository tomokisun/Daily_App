//
//  ViewController.swift
//  40
//
//  Created by 築山朋紀 on 2019/03/06.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet private weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPress(gesture:)))
        longPress.minimumPressDuration = 1
        button.addGestureRecognizer(longPress)
    }
    
    @objc func longPress(gesture: UILongPressGestureRecognizer) {
        let avDevice = AVCaptureDevice.default(for: .video)
        if (avDevice?.hasTorch)! {
            do {
                try avDevice?.lockForConfiguration()
                
                switch gesture.state {
                case .began:
                    avDevice?.torchMode = .on
                case .ended:
                    avDevice?.torchMode = .off
                case .cancelled, .changed, .failed, .possible:
                    print("error")
                }
                
                avDevice?.unlockForConfiguration()
                
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
}
