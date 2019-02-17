//
//  GameEndViewController.swift
//  23
//
//  Created by 築山朋紀 on 2019/02/17.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class GameEndViewController: UIViewController {
    
    private var score: Int
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        scoreLabel.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: 100)
        scoreLabel.text = """
        あなたのスコアは
        \(score)点
        でした。
        """
        self.view.addSubview(scoreLabel)
    }
    
    init(score: Int) {
        self.score = score
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
