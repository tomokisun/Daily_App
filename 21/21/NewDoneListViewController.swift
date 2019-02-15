//
//  NewDoneListViewController.swift
//  21
//
//  Created by 築山朋紀 on 2019/02/15.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class NewDoneListViewController: UIViewController {
    
    @IBOutlet private weak var doneTextInput: UITextField!
    @IBOutlet private weak var dateTextInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension NewDoneListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == doneTextInput {
            dateTextInput.becomeFirstResponder()
        }
        return true
    }
}
