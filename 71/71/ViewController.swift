//
//  ViewController.swift
//  71
//
//  Created by 築山朋紀 on 2019/04/06.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var musicModel = [MusicModel]()
    private var currentIndex = 0
    private var timer = Timer()
    private var count = 0
    
    @IBOutlet private weak var timeLabel: UILabel!
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
        
        musicModel.append(MusicModel(image: UIImage(named: "001_iri"), title: "Shade", name: "iri"))
        musicModel.append(MusicModel(image: UIImage(named: "002_ame"), title: "Change your pops", name: "ame_no_parade"))
        musicModel.append(MusicModel(image: UIImage(named: "003_ame"), title: "stage ", name: "ame_no_parade"))
        musicModel.append(MusicModel(image: UIImage(named: "004_sakana"), title: "ユリイカ", name: "サカナクション"))
        musicModel.append(MusicModel(image: UIImage(named: "005_tempalay"), title: "革命前夜", name: "Tempalay"))
        musicModel.append(MusicModel(image: UIImage(named: "006_sakana"), title: "Sakanaction", name: "サカナクション"))
        musicModel.append(MusicModel(image: UIImage(named: "007_polca"), title: "全知全能", name: "ポルカドットスティングレイ"))
        
        read()
        startTimer()
    }
    
    private func read() {
        headerImageView.image = musicModel[currentIndex].image
        musicIImageView.image = musicModel[currentIndex].image
        musicNameLabel.text = musicModel[currentIndex].title
        artistNameLabel.text = musicModel[currentIndex].name
        if timer.isValid {
            timer.invalidate()
            self.count = 0
            timeLabel.text = "0:\(count)"
            progressBar.progress = 0.0
            startTimer()
        }
    }

    @IBAction private func stopButtonDidTappend() {
        
    }
    
    @IBAction private func nextButtonDidTappend() {
        if currentIndex == musicModel.count - 1 {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
        read()
    }
    
    @IBAction private func backButtonDidTappend() {
        if currentIndex == 0 {
            currentIndex = musicModel.count - 1
        } else {
            currentIndex -= 1
        }
        read()
    }
    
    private func startTimer() {
        if !timer.isValid {
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(self.countUp),
                userInfo: nil,
                repeats: true
            )
        }
    }
    
    @objc private func countUp() {
        count += 1
        progressBar.progress = Float(count / 206)
        timeLabel.text = "0:\(count)"
    }
}

class MusicModel {
    let image: UIImage?
    let title: String
    let name: String
    
    init(image: UIImage?, title: String, name: String) {
        self.image = image
        self.title = title
        self.name = name
    }
}
