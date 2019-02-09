//
//  ViewController.swift
//  15
//
//  Created by 築山朋紀 on 2019/02/09.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Accounts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func tappend() {
        let shareImage = UIImage(named: "hanage")!
        let activityItems = [shareImage]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
            UIActivity.ActivityType.postToFacebook,
            UIActivity.ActivityType.postToTwitter,
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.mail,
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.copyToPasteboard,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.saveToCameraRoll,
            UIActivity.ActivityType.addToReadingList,
            UIActivity.ActivityType.postToFlickr,
            UIActivity.ActivityType.postToVimeo,
            UIActivity.ActivityType.postToWeibo,
            UIActivity.ActivityType.postToTencentWeibo,
            UIActivity.ActivityType.openInIBooks,
            UIActivity.ActivityType.markupAsPDF
        ]
        activityVC.excludedActivityTypes = excludedActivityTypes
        self.present(activityVC, animated: true)
    }
}

