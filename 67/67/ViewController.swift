//
//  ViewController.swift
//  67
//
//  Created by 築山朋紀 on 2019/04/02.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    private var locationManager: CLLocationManager!
    @IBOutlet private weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            
            // 何度動いたら更新するか（デフォルトは1度）
            locationManager.headingFilter = kCLHeadingFilterNone
            
            // デバイスのどの向きを北とするか（デフォルトは画面上部）
            locationManager.headingOrientation = .portrait
            
            locationManager.startUpdatingHeading()
        }
    }

//    let angle = CGFloat(i) * CGFloat.pi / 180
//    let transRotate = CGAffineTransform(rotationAngle: CGFloat(angle))
//    self.imageView.transform = transRotate
    
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
             locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            break
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let heading: CGFloat = CGFloat(newHeading.magneticHeading)
        let angle = heading * CGFloat.pi / 180
        let transRotate = CGAffineTransform(rotationAngle: angle)
        self.imageView.transform = transRotate
    }
}


