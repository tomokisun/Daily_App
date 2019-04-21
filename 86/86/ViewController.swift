//
//  ViewController.swift
//  86
//
//  Created by 築山朋紀 on 2019/04/21.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

var names = [String]()

class ViewController: UIViewController {
    
    @IBOutlet private var buttons: [Button]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        output()
        buttons.forEach { button in
        }
        buttons.enumerated().forEach {
            $0.element.addTarget(self, action: #selector(didTappend), for: UIControl.Event.touchUpInside)
            $0.element.tag = $0.offset
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        output()
    }
    
    @objc private func didTappend(_ sender: Button) {
        let storyboard = self.storyboard!
        guard let target = storyboard.instantiateViewController(withIdentifier: "InputViewController") as? InputViewController else {
            return
        }
        target.index = sender.tag
        self.present(target, animated: true)

    }

    @IBAction private func shuffleButtonDidTappend(_ sender: Button) {
        names.shuffle()
        output()
    }
    
    private func output() {
        buttons.enumerated().forEach {
            $0.element.setTitle(names[$0.offset], for: .normal)
        }
    }
}

class InputViewController: UIViewController {
    @IBOutlet private weak var nameInputField: InputField!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func doneButtonDidTappend(_ sender: Button) {
        /// 決定したときの処理を書く
        names[index] = nameInputField.text!
        self.dismiss(animated: true)
    }
    
    @IBAction private func skipButtonDidTappend(_ sender: Button) {
        self.dismiss(animated: true)
    }
}

extension ViewController {
    private func setUp() {
        for _ in 1...20 {
            names.append("名前を入力")
        }
    }
}

extension Array {
    mutating func shuffle() {
        for i in 0..<self.count {
            let j = Int(arc4random_uniform(UInt32(self.indices.last!)))
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}
