//
//  ViewController.swift
//  32
//
//  Created by 築山朋紀 on 2019/02/26.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    private var urlString = "" {
        didSet {
            label.text = urlString
        }
    }
    
    @IBOutlet private weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpLocationManager()
    }
    
    private func setUpLocationManager() {
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.distanceFilter = 10
            locationManager.startUpdatingLocation()
        }
    }
    
    @IBAction private func tappend() {
        setUpLocationManager()
        let text = urlString
        let activityItems = [text]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        // 使用しないアクティビティタイプ
        let excludedActivityTypes = [
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

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location = locations.first
        guard let latitude = location?.coordinate.latitude else { return }
        guard let longitude = location?.coordinate.longitude else { return }
        
        urlString = """
        私は今ここにいます！URLタップ！！
        https://www.google.com/maps?q=\(latitude),\(longitude)
        """
    }
}
