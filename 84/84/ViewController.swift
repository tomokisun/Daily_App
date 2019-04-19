//
//  ViewController.swift
//  84
//
//  Created by 築山朋紀 on 2019/04/19.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Firebase

var displayMemo = ""

class ViewController: UIViewController {
    
    @IBOutlet private weak var passcodeInputField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction private func buttonDidTappend(_ sender: UIButton) {
        guard let passcode = passcodeInputField.text else { return }
        let rootRef = Database.database().reference()
        rootRef.observe(.childAdded, with: { [weak self] snapshot -> Void in
            let code = String(describing: snapshot.childSnapshot(forPath: "passcode").value!)
            let memo = String(describing: snapshot.childSnapshot(forPath: "text").value!)
            guard passcode == code else { return }
            displayMemo = memo
            self?.performSegue(withIdentifier: "toMemoViewController", sender: nil)
        })
    }
}

