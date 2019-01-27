//
//  ViewController.swift
//  02
//
//  Created by 築山朋紀 on 2019/01/27.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var button1: UIButton!
    @IBOutlet private weak var button2: UIButton!
    @IBOutlet private weak var button3: UIButton!
    @IBOutlet private weak var button4: UIButton!
    @IBOutlet private weak var button5: UIButton!
    @IBOutlet private weak var button6: UIButton!
    @IBOutlet private weak var button7: UIButton!
    @IBOutlet private weak var button8: UIButton!
    @IBOutlet private weak var button9: UIButton!
    
    /// どっちがボタンを押せるか
    private var isUser = true
    private var count = 0
    
    /// 先攻の勝ち
    private var firstAttack = ["⭕", "⭕", "⭕"]
    
    /// 後攻の勝ち
    private var afterAttack = ["❌", "❌", "❌"]
    
    private var horizontal1 = ["", "", ""]
    private var horizontal2 = ["", "", ""]
    private var horizontal3 = ["", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func button1Tappend(sender: UIButton) {
        if isUser {
            sender.setTitle("⭕", for: .normal)
            horizontal1.insert("⭕", at: sender.tag)
            horizontal1.remove(at: horizontal1.count - 1)
        } else {
            sender.setTitle("❌", for: .normal)
            horizontal1.insert("❌", at: sender.tag)
            horizontal1.remove(at: horizontal1.count - 1)
        }
        isUser.toggle()
        sender.isUserInteractionEnabled = false
        self.hoge()
    }
    
    @IBAction private func button2Tappend(sender: UIButton) {
        if isUser {
            sender.setTitle("⭕", for: .normal)
            horizontal2.insert("⭕", at: sender.tag)
            horizontal2.remove(at: horizontal2.count - 1)
        } else {
            sender.setTitle("❌", for: .normal)
            horizontal2.insert("❌", at: sender.tag)
            horizontal2.remove(at: horizontal2.count - 1)
        }
        isUser.toggle()
        sender.isUserInteractionEnabled = false
        self.hoge()
    }
    
    @IBAction private func button3Tappend(sender: UIButton) {
        if isUser {
            sender.setTitle("⭕", for: .normal)
            horizontal3.insert("⭕", at: sender.tag)
            horizontal3.remove(at: horizontal3.count - 1)
        } else {
            sender.setTitle("❌", for: .normal)
            horizontal3.insert("❌", at: sender.tag)
            horizontal3.remove(at: horizontal3.count - 1)
        }
        isUser.toggle()
        sender.isUserInteractionEnabled = false
        self.hoge()
    }
    
    private func hoge() {
        let items = [horizontal1, horizontal2, horizontal3]
        for i in items {
            switch self.isPlayer(item: i) {
            case .first:
                self.showAlert(name: "先攻")
            case .second:
                self.showAlert(name: "後攻")
            case .none:
                break
            }
        }
        count += 1
        if count == 9 {
            self.gameOver()
        }
    }
    
    private func isPlayer(item: Array<String>) -> isPlayer {
        if item == firstAttack {
            return .first
        }
        if item == afterAttack {
            return .second
        }
        return .none
    }
    
    private func showAlert(name: String) {
        let alert = UIAlertController(title: "終了", message: "\(name)の勝ち", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.horizontal1 = ["", "", ""]
            self.horizontal2 = ["", "", ""]
            self.horizontal3 = ["", "", ""]
        }
        alert.addAction(doneButton)
        present(alert, animated: true)
    }
    
    private func gameOver() {
        count = 0
        let alert = UIAlertController(title: "終了", message: "ゲーム終了", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "OK", style: .default) { _ in
            self.horizontal1 = ["", "", ""]
            self.horizontal2 = ["", "", ""]
            self.horizontal3 = ["", "", ""]
        }
        alert.addAction(doneButton)
        present(alert, animated: true)
    }
    
    private enum isPlayer{
        case first
        case second
        case none
    }
}

extension UIButton {
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1
        self.titleLabel?.text = ""
    }
}
