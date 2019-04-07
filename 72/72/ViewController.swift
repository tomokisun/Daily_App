//
//  ViewController.swift
//  72
//
//  Created by 築山朋紀 on 2019/04/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction private func didTappend() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: "toHoge", sender: nil)
        }
    }
}

class HogeViewController: UIViewController {
    @IBAction private func backButton() {
        self.dismiss(animated: true)
    }
}
