//
//  TaskAddView.swift
//  05
//
//  Created by 築山朋紀 on 2019/01/30.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

protocol TaskAddViewDelegate: class {
    func textField(_ view: TaskAddView, text: String)
}

class TaskAddView: UIView {
    
    @IBOutlet private weak var textInput: UITextField!
    weak var delegate: TaskAddViewDelegate?

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.textInput.delegate = self
        self.layer.cornerRadius = 20
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}

extension TaskAddView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.textField(self, text: textField.text!)
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
}
