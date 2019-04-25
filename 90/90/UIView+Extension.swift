//
//  UIView+Extension.swift
//  90
//
//  Created by 築山朋紀 on 2019/04/25.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

protocol NibInitializable {}

extension NibInitializable where Self: UIView {
    static func loadFromNib(index: Int = 0) -> Self {
        guard let view = UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: self, options: nil)[index] as? Self else {
            fatalError("Invalid Nib name")
        }
        return view
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var name: String {
        return String(describing: self)
    }
}

extension UIView: NibInitializable {}
