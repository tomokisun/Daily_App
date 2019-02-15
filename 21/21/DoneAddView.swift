//
//  DoneAddView.swift
//  21
//
//  Created by 築山朋紀 on 2019/02/15.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

protocol DoneAddViewDelegate: class {
    func textField(_ view: DoneAddView, text: String)
}

class DoneAddView: UIView {
    
    @IBOutlet private weak var textInput: UITextField!
    weak var delegate: DoneAddViewDelegate?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.textInput.delegate = self
        self.layer.cornerRadius = 20
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

extension DoneAddView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textField(self, text: textField.text!)
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
}
