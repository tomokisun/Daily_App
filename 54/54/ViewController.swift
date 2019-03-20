//
//  ViewController.swift
//  54
//
//  Created by 築山朋紀 on 2019/03/20.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        UINavigationBar.appearance().tintColor = UIColor.red
        UINavigationBar.appearance().barTintColor = UIColor.yellow
        UINavigationBar.appearance().titleTextAttributes = convertToOptionalNSAttributedStringKeyDictionary([NSAttributedString.Key.foregroundColor.rawValue : UIColor.green])
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func toggleButtonTapped(_ sender: Any) {
        AppFeedback.isHidden = !AppFeedback.isHidden
    }
    
    @IBAction func actionSheetButtonTapped(_ sender: Any) {
        let ac = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped.")
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) -> Void in
            AppFeedback.showDialog()
        }
        
        ac.addAction(cancelAction)
        ac.addAction(okAction)
        
        present(ac, animated: true, completion: nil)
    }
    
    @IBAction func captureVideoButtonTapped(_ sender: Any) {
        AppFeedback.startRecording()
    }
    
    @IBAction func captureVideoEndButtonTapped(_ sender: Any) {
        AppFeedback.endRecording()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalNSAttributedStringKeyDictionary(_ input: [String: Any]?) -> [NSAttributedString.Key: Any]? {
    guard let input = input else { return nil }
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (NSAttributedString.Key(rawValue: key), value)})
}

