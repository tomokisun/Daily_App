//
//  ViewController.swift
//  81
//
//  Created by 築山朋紀 on 2019/04/16.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var restartButton: UIButton!
    @IBOutlet private weak var startButton: UIButton!
    @IBOutlet private weak var stopButton: UIButton!
    @IBOutlet private weak var label: UILabel!
    
    var count = 432
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        state(of: .stopped)
    }
    
    @IBAction func start() {
        if !timer.isValid {
            //タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(self.up),
                userInfo: nil,
                repeats: true
            )
            state(of: .playing)
        }
    }
    
    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
        }
        state(of: .paused)
    }
    
    @IBAction func reset() {
        count = 0
        label.text = "00:00"
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
        }
        state(of: .stopped)
    }
    
    @objc func up() {
        count += 1
        label.text = toTime(TimeInterval(count))
    }
    
    func state(of hidden: hidden) {
        switch hidden {
        case .stopped:
            resetButton.isHidden = true
            stopButton.isHidden = true
            restartButton.isHidden = true
            startButton.isHidden = false
        case .playing:
            startButton.isHidden = true
            resetButton.isHidden = true
            restartButton.isHidden = true
            stopButton.isHidden = false
        case .paused:
            startButton.isHidden = true
            stopButton.isHidden = true
            resetButton.isHidden = false
            restartButton.isHidden = false
        }
    }
    
    private func toTime(_ b: TimeInterval) -> String? {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .positional
        formatter.allowedUnits = [.minute, .hour, .second]
        return formatter.string(from: b)
    }
}

extension ViewController {
    enum hidden {
        /// 停止中
        case stopped
        /// 再生中
        case playing
        /// 一時停止中
        case paused
    }
}
