//
//  PurchaseViewController.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    @IBOutlet private weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        textView.layer.cornerRadius = 5
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        
        let button = UIBarButtonItem(title: "送信", style: .done, target: self, action: #selector(self.doneButton))
        navigationItem.setRightBarButton(button, animated: true)
    }
    
    @objc private func doneButton() {
        self.performSegue(withIdentifier: "toTabBar", sender: nil)
    }
}
