//
//  MainViewController.swift
//  FarmerEC
//
//  Created by 築山朋紀 on 2019/02/02.
//  Copyright © 2019 Aoki Riku. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var nameInput: UITextField!
    @IBOutlet private weak var localInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction private func register() {
        guard let name = nameInput.text else { return }
        guard let local = localInput.text else { return }
        
        UserAPI.fetchUserRegister(name: name, local: local) { result in
            switch result {
            case .success(let decoded):
                print(decoded)
                self.performSegue(withIdentifier: "toTabBar", sender: nil)
            case .failure(_, let statusCode):
                print(statusCode ?? "")
            }
        }
    }
}
