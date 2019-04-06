//
//  HeaderView.swift
//  71
//
//  Created by 築山朋紀 on 2019/04/06.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

@IBDesignable
class HeaderView: UIView {
    
    @IBInspectable var image: UIImage? {
        get {
            return headerImageView.image
        }
        set {
            headerImageView.image = newValue
            mainImageView.image = newValue
        }
    }
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var mainImageView: UIImageView!
    
    private func setUp() {
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
}
