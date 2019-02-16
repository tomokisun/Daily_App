//
//  ViewController.swift
//  22
//
//  Created by 築山朋紀 on 2019/02/16.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    private var myAudioPlayer : AVAudioPlayer!
    @IBOutlet private weak var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        let soundFilePath = Bundle.main.bundleURL.appendingPathComponent("okamochan.mp3")
        do {
            try myAudioPlayer = AVAudioPlayer(contentsOf: soundFilePath)
            myAudioPlayer.prepareToPlay()
        } catch {
            print(error)
        }
        
        myButton.layer.cornerRadius = 60
    }
    
    @IBAction private func tappend(sender: UIButton) {
        myAudioPlayer.play()
    }
}
