//
//  ViewController.swift
//  42
//
//  Created by 築山朋紀 on 2019/03/08.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextViewDelegate {
    
    private let urlString = "<SLACK_WEB_HOOK_URL>"
    
    @IBOutlet private weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func sedAction() {
        request()
    }

    private func request() {
        guard let textString = textView.text else { return }
        let text = """
        内容:
        \(textString)
        """
        let parameters: [String: String] = [
            "channel": "#daily_app",
            "username": "クソアプリ案通知",
            "text": text,
            "icon_url": "http://2.bp.blogspot.com/-Rd_w7b2kq70/VnE4FZen5oI/AAAAAAAA18w/mMasxPYIuCM/s800/pose_kyosyu_boy.png"
        ]
        
        Alamofire.request(urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default).response { response in
            if response.response?.statusCode == 200 {
    
            } else {
    
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
