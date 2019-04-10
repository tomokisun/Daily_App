//
//  ViewController.swift
//  75
//
//  Created by 築山朋紀 on 2019/04/10.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet private weak var myMapView: MKMapView!
    @IBOutlet private weak var countLabel: UILabel! {
        didSet {
            countLabel.layer.cornerRadius = 20
            countLabel.layer.borderColor = UIColor.darkGray.cgColor
            countLabel.layer.borderWidth = 1
            countLabel.clipsToBounds = true
        }
    }
    private var count = 0 {
        didSet {
            countLabel.text = String(count)
        }
    }
    var myLocationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLocationManager = CLLocationManager()
        myLocationManager.delegate = self
        myLocationManager.distanceFilter = 100.0
        myLocationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        
        let status = CLLocationManager.authorizationStatus()
        // まだ認証が得られていない場合は、認証ダイアログを表示.
        if status != CLAuthorizationStatus.authorizedWhenInUse {
            myLocationManager.requestWhenInUseAuthorization()
        }
        myLocationManager.startUpdatingLocation()
        
        myMapView.delegate = self
        
        // 中心点の緯度経度.
        let myLat: CLLocationDegrees = 37.506804
        let myLon: CLLocationDegrees = 139.930531
        let myCoordinate: CLLocationCoordinate2D = CLLocationCoordinate2DMake(myLat, myLon) as CLLocationCoordinate2D
        
        let myLatDist : CLLocationDistance = 100
        let myLonDist : CLLocationDistance = 100
        
        let myRegion = MKCoordinateRegion(center: myCoordinate, latitudinalMeters: myLatDist, longitudinalMeters: myLonDist)
        myMapView.setRegion(myRegion, animated: true)
        
        let myLongPress: UILongPressGestureRecognizer = UILongPressGestureRecognizer()
        myLongPress.addTarget(self, action: #selector(self.recognizeLongPress(sender:)))
        myMapView.addGestureRecognizer(myLongPress)
    }
    
    // 長押しを感知した際に呼ばれるメソッド.
    @objc func recognizeLongPress(sender: UILongPressGestureRecognizer) {
        
        // 長押しの最中に何度もピンを生成しないようにする.
        if sender.state != UIGestureRecognizer.State.began { return }
        
        // 長押しした地点の座標を取得.
        let location = sender.location(in: myMapView)
        
        // locationをCLLocationCoordinate2Dに変換.
        let myCoordinate: CLLocationCoordinate2D = myMapView.convert(location, toCoordinateFrom: myMapView)
        
        // ピンを生成.
        let myPin: MKPointAnnotation = MKPointAnnotation()
        
        // 座標を設定.
        myPin.coordinate = myCoordinate
        
        // MapViewにピンを追加.
        myMapView.addAnnotation(myPin)
        count += 1
        countLabel.text = "\(count)箇所"
    }
    
    /*
     addAnnotationした際に呼ばれるデリゲートメソッド.
     */
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let myPinIdentifier = "PinAnnotationIdentifier"
        
        // ピンを生成.
        let myPinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: myPinIdentifier)
        
        // アニメーションをつける.
        myPinView.animatesDrop = true
        
        // コールアウトを表示する.
        myPinView.canShowCallout = true
        
        // annotationを設定.
        myPinView.annotation = annotation
        
        return myPinView
    }
    
    // GPSから値を取得した際に呼び出されるメソッド.
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        print("didUpdateLocations")
        
        // 配列から現在座標を取得.
        let myLocations: NSArray = locations as NSArray
        let myLastLocation: CLLocation = myLocations.lastObject as! CLLocation
        let myLocation:CLLocationCoordinate2D = myLastLocation.coordinate
        
        print("\(myLocation.latitude), \(myLocation.longitude)")
        
        // 縮尺.
        let myLatDist : CLLocationDistance = 100
        let myLonDist : CLLocationDistance = 100
        
        // Regionを作成.
        let myRegion: MKCoordinateRegion = MKCoordinateRegion(center: myLocation, latitudinalMeters: myLatDist, longitudinalMeters: myLonDist);
        
        // MapViewに反映.
        myMapView.setRegion(myRegion, animated: true)
    }
    
    // Regionが変更した時に呼び出されるメソッド.
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        print("regionDidChangeAnimated")
    }
    
    // 認証が変更された時に呼び出されるメソッド.
    private func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            print("AuthorizedAlways")
        case .authorizedWhenInUse:
            print("AuthorizedWhenInUse")
        case .denied:
            print("Denied")
        case .restricted:
            print("Restricted")
        case .notDetermined:
            print("NotDetermined")
        }
    }
    
    private func now() -> String {
        let f = DateFormatter()
        f.timeStyle = .full
        f.dateStyle = .long
        f.locale = Locale(identifier: "ja_JP")
        let time = f.string(from: Date())
        return time
    }
}

class Label: UILabel {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    override func draw(_ rect: CGRect) {
        
    }
}
