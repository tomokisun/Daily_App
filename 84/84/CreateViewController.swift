//
//  CreateViewController.swift
//  84
//
//  Created by 築山朋紀 on 2019/04/19.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Firebase

class CreateViewController: UITableViewController {
    
    @IBOutlet private weak var passcodeInputField: UITextField!
    @IBOutlet private weak var memoTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction private func saveButtonDidTappend(_ sender: UIBarButtonItem) {
        guard let passcode = passcodeInputField.text, let memo = memoTextView.text else {
            return
        }
        let rootRef = Database.database().reference()
        let postRef = rootRef.childByAutoId()
        let body = ["passcode": passcode, "text": memo]
        postRef.setValue(body)
        present(saveDoneAlert(), animated: true)
    }
    
    private func saveDoneAlert() -> UIAlertController {
        let alert = UIAlertController(title: "保存", message: "保存しました", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        return alert
    }
}
