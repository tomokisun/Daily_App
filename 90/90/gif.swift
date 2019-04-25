//
//  gif.swift
//  90
//
//  Created by 築山朋紀 on 2019/04/25.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import ImageIO

extension UIImage {
    
    static func animatedGIF(data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        
        let count = CGImageSourceGetCount(source)
        
        var images: [UIImage] = []
        var duration = 0.0
        for i in 0..<count {
            guard let imageRef = CGImageSourceCreateImageAtIndex(source, i, nil) else {
                continue
            }
            
            guard let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any] else {
                continue
            }
            
            guard let gifDictionary = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any] else {
                continue
            }
            
            guard let delayTime = gifDictionary[kCGImagePropertyGIFDelayTime as String] as? Double else {
                continue
            }
            
            duration += delayTime
            
            // pre-render
            let image = UIImage(cgImage: imageRef, scale: UIScreen.main.scale, orientation: .up)
            UIGraphicsBeginImageContextWithOptions(image.size, false, 0.0)
            image.draw(in: CGRect(x: 0.0, y: 0.0, width: image.size.width, height: image.size.height))
            let renderedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            if let renderedImage = renderedImage {
                images.append(renderedImage)
            }
        }
        
        return UIImage.animatedImage(with: images, duration: duration)
    }
}

extension UIImageView {
    
    func animateGIF(data: Data,
                    animationRepeatCount: UInt = 1,
                    completion: (() -> Void)? = nil) {
        guard let animatedGIFImage = UIImage.animatedGIF(data: data) else {
            return
        }
        
        self.image = animatedGIFImage.images?.last
        self.animationImages = animatedGIFImage.images
        self.animationDuration = animatedGIFImage.duration
        self.animationRepeatCount = Int(animationRepeatCount)
        self.startAnimating()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animatedGIFImage.duration * Double(animationRepeatCount)) {
            completion?()
        }
    }
}
