//
//  Button.swift
//  86
//
//  Created by 築山朋紀 on 2019/04/21.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

@IBDesignable
class Button: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    @IBInspectable var shadowColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }
    @IBInspectable var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
}

class NameButton: Button {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.cornerRadius = rect.height / 2
        self.layer.masksToBounds = true
    }
}

@IBDesignable
class InputField: UITextField {
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.attributedPlaceholder = NSAttributedString(string: "名前を入力", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
    }
}
