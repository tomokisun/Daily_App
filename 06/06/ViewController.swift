//
//  ViewController.swift
//  06
//
//  Created by 築山朋紀 on 2019/01/31.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    private var locationManager: CLLocationManager!
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func heyAction() {
        self.setupLocationManager()
        locationManager.startUpdatingLocation()
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
        
      //https://www.google.com/maps?q=35.6694219,139.4612045
        print("https://www.google.com/maps?q=\(latitude),\(longitude)")
        self.showRequest(location: "https://www.google.com/maps?q=\(latitude),\(longitude)")
    }
    
    private func showRequest(location: String) {
        let url = ""
        let text = """
        呼び出されました。
        住所: \(location)
        """
        
        let parameters: Parameters = [
            "channel": "#daily_app",
            "username": "オカン送り迎え",
            "text": text
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            if response.response?.statusCode == 200 {
                self.label.text = "オカンを呼びました。\n到着までお待ち下さい。"
            } else {
                self.label.text = "error!!\nもう一度タップしてください"
            }
        }
    }
}

extension UIButton {
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = rect.width / 2
        self.clipsToBounds = true
    }
}

