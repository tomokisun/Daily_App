//
//  ViewController.swift
//  06
//
//  Created by 築山朋紀 on 2019/01/31.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    private var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLocationManager()
    }
    
    func setupLocationManager() {
        locationManager = CLLocationManager()
        
        guard let locationManager = locationManager else { return }
        
        locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            locationManager.delegate = self
            locationManager.distanceFilter = 10
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        guard let latitude = location?.coordinate.latitude else { return }
        guard let longitude = location?.coordinate.longitude else { return }
        
        print("latitude: \(latitude)\nlongitude: \(longitude)")
        
//        https://www.google.com/maps?q=35.6694219,139.4612045
        print("https://www.google.com/maps?q=\(latitude),\(longitude)")
    }
}

