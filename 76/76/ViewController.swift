//
//  ViewController.swift
//  76
//
//  Created by 築山朋紀 on 2019/04/11.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapPoint = CGPoint(x: 0, y: 0)
    
    @IBOutlet private weak var colorLabel: UILabel!
    @IBOutlet private weak var colorImage: UIImageView!
    @IBOutlet private weak var photoImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction private func selectImageButtonDidTappend(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }
    
    @IBAction func getImageRGB(_ sender: UITapGestureRecognizer) {
        
        guard photoImageView.image != nil else {return}
        
        //タップした座標の取得
        tapPoint = sender.location(in: photoImageView)
        
        let cgImage = photoImageView.image?.cgImage!
        let pixelData = cgImage?.dataProvider!.data
        let data: UnsafePointer = CFDataGetBytePtr(pixelData)
        //1ピクセルのバイト数
        let bytesPerPixel = (cgImage?.bitsPerPixel)! / 8
        //1ラインのバイト数
        let bytesPerRow = (cgImage?.bytesPerRow)!
        //タップした位置の座標にあたるアドレスを算出
        let pixelAd: Int = Int(tapPoint.y) * bytesPerRow + Int(tapPoint.x) * bytesPerPixel
        //それぞれRGBAの値をとる
        let r = Int( CGFloat(data[pixelAd]))
        let g = Int( CGFloat(data[pixelAd+1]))
        let b = Int( CGFloat(data[pixelAd+2]))
        
        colorImage.backgroundColor = UIColor.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: 1)
        
        //navigationbarに結果を表示
        let R = "R:" + String(Int(r))
        let G = " G:" + String(Int(g))
        let B = " B:" + String(Int(b))
        colorLabel.text = R + G + B
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        photoImageView.image = image
        self.dismiss(animated: true)
    }
}


extension UIColor {
    convenience init(hex: String, alpha: CGFloat) {
        let v = hex.map { String($0) } + Array(repeating: "0", count: max(6 - hex.count, 0))
        let r = CGFloat(Int(v[0] + v[1], radix: 16) ?? 0) / 255.0
        let g = CGFloat(Int(v[2] + v[3], radix: 16) ?? 0) / 255.0
        let b = CGFloat(Int(v[4] + v[5], radix: 16) ?? 0) / 255.0
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
    
    convenience init(hex: String) {
        self.init(hex: hex, alpha: 1.0)
    }
}
