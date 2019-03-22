//
//  ViewController.swift
//  56
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

struct Model: Codable {
//    let minutely: SummaryModel
//    let hourly: SummaryModel
    let daily: SummaryModel
}

struct SummaryModel: Codable {
    let summary: String
}

class ViewController: UIViewController {
    
    private let locationManager = CLLocationManager()
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

    private func request(latitudez: Double, longitude: Double) {
        let url = "https://api.darksky.net/forecast/6cb2004c7f86f5bfc66fc1c7b221ade3/\(latitudez),\(longitude)?lang=ja"
        Alamofire.request(url, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else { return }
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode(Model.self, from: data)
                    print(decoded)
                    self.label.text = decoded.daily.summary
                } catch {
                    print(response)
                    print("\(type(of: Model.self))型の変換に失敗しました")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.first
        guard let latitude = location?.coordinate.latitude else { return }
        guard let longitude = location?.coordinate.longitude else { return }
        request(latitudez: latitude, longitude: longitude)
    }
}

