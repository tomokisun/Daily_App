//
//  MemoViewController.swift
//  84
//
//  Created by 築山朋紀 on 2019/04/19.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class MemoViewController: UITableViewController {
    
    @IBOutlet private weak var memoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        memoLabel.text = displayMemo
    }
}
