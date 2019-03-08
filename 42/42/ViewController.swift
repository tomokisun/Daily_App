//
//  ViewController.swift
//  42
//
//  Created by 築山朋紀 on 2019/03/08.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class ViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
    
    private let urlString = "http://geoapi.heartrails.com/api/json?method=searchByGeoLocation&x=135.0&y=35.0"

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

    private func request(x: String, y: String) {
        PostalAPI.fetch(x: x, y: y) { result in
            switch result {
            case .success(let value):
                print(value)
            case .failure:
                print("error")
            }
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        let location = locations.first
        guard let latitude = location?.coordinate.latitude else { return }
        guard let longitude = location?.coordinate.longitude else { return }
        request(x: String(latitude), y: String(longitude))
    }
}

