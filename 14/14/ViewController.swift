//
//  ViewController.swift
//  14
//
//  Created by 築山朋紀 on 2019/02/08.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class TapViewController: UIViewController {
    
    @IBOutlet private weak var lable: UILabel!
    
    @IBOutlet var imageView: UIImageView!
    var image = UIImage()
    //表示されている画像のタップ座標用変数
    var tapPoint = CGPoint(x: 0, y: 0)
    
    override func viewDidLoad() {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //imageviewをタップした時に色を判別
    @IBAction func getImageRGB(_ sender: UITapGestureRecognizer) {
        
        guard imageView.image != nil else {return}
        
        //タップした座標の取得
        tapPoint = sender.location(in: imageView)
        
        let cgImage = imageView.image?.cgImage!
        let pixelData = cgImage?.dataProvider!.data
        let data: UnsafePointer = CFDataGetBytePtr(pixelData)
        //1ピクセルのバイト数
        let bytesPerPixel = (cgImage?.bitsPerPixel)! / 8
        //1ラインのバイト数
        let bytesPerRow = (cgImage?.bytesPerRow)!
        print("bytesPerPixel=\(bytesPerPixel) bytesPerRow=\(bytesPerRow)")
        //タップした位置の座標にあたるアドレスを算出
        let pixelAd: Int = Int(tapPoint.y) * bytesPerRow + Int(tapPoint.x) * bytesPerPixel
        //それぞれRGBAの値をとる
        let r = Int( CGFloat(data[pixelAd]))
        let g = Int( CGFloat(data[pixelAd+1]))
        let b = Int( CGFloat(data[pixelAd+2]))
        let a = CGFloat(Int( CGFloat(data[pixelAd+3])/CGFloat(255.0)*100)) / 100
        
        print([r,g,b,a])
        
        lable.backgroundColor = UIColor.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: a)
        
        //navigationbarに結果を表示
        let R = "R:" + String(Int(r))
        let G = " G:" + String(Int(g))
        let B = " B:" + String(Int(b))
        let A = " A:" +  String(format: "%.1f", a)
        navigationItem.title = R + G + B + A
    }
    
    
}


//画像を選択
extension TapViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //画像を選んだ時の処理
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
//        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        let selectedImage = UIImage()
        //サイズを圧縮する
        // let resizedImage = selectedImage.scale(byFactor: 0.4)
        
        image = selectedImage
        
        var imageHeight = image.size.height
        var imageWidth = image.size.width
        
        let navigationBarHeight = navigationController?.navigationBar.frame.height
        let width = self.view.frame.width
        let height = self.view.frame.height
        let centerX = self.view.center.x
        let centerY = self.view.center.y
        let widthRatio = imageWidth
        let heightRatio = imageHeight
        //画像の大きさに応じてiamgeviewのサイズを変える
        if imageHeight > self.view.frame.height || imageWidth > self.view.frame.width {
            imageWidth = width
            imageHeight = width*heightRatio/widthRatio
            
        } else if imageHeight > self.view.frame.height {
            imageHeight = height
            imageWidth = height*widthRatio/heightRatio
            
        } else if imageWidth > self.view.frame.width {
            imageWidth = width
            imageHeight = width*heightRatio/widthRatio
            
        } else {
        }
        
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.frame.size = CGSize(width: imageWidth, height: imageHeight)
        //画像がnavigationbarに被らないようにする
        if imageHeight/2 > (height/2 - navigationBarHeight!) {
            imageView.center = CGPoint(x: centerX, y: centerY + navigationBarHeight!)
        } else {
            imageView.center = CGPoint(x: centerX, y: centerY)
        }
        
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    // 撮影がキャンセルされた時に呼ばれる
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func tappedlibrary() {
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.photoLibrary){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
        else{
            print("error")
            
        }
    }
    
    func tappedcamera() {
        let sourceType:UIImagePickerController.SourceType =
            UIImagePickerController.SourceType.camera
        // カメラが利用可能かチェック
        if UIImagePickerController.isSourceTypeAvailable(
            UIImagePickerController.SourceType.camera){
            // インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
            
        }
        else{
            print("error")
        }
    }
    
    @IBAction func selecteImageButton(_ sender: UITapGestureRecognizer) {
        //アラート表示のために
        let actionSheet = UIAlertController(title: "", message: "写真の選択", preferredStyle: UIAlertController.Style.actionSheet)
        
        let tappedcamera = UIAlertAction(title: "カメラで撮影する", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            self.tappedcamera()
        })
        
        let tappedlibrary = UIAlertAction(title: "ライブラリから選択する", style: UIAlertAction.Style.default, handler: {
            (action: UIAlertAction!) in
            self.tappedlibrary()
        })
        
        let cancel = UIAlertAction(title: "キャンセル", style: UIAlertAction.Style.cancel, handler: {
            (action: UIAlertAction!) in
            print("キャンセル")
        })
        
        actionSheet.addAction(tappedcamera)
        actionSheet.addAction(tappedlibrary)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
}

import UIKit

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
