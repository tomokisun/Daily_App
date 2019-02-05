//
//  ViewController.swift
//  11
//
//  Created by 築山朋紀 on 2019/02/05.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    private let userDefault = UserDefaults.standard
    private var items: String = ""
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if userDefault.object(forKey: "message") != nil {
            items = userDefault.string(forKey: "message")!
        }
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = items
        print(items)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

class AddMessageViewController: UIViewController {
    
    @IBOutlet var textView: UITextView!
    private let userDefault = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction private func addMessage() {
        guard let text = self.textView.text else { return }
        userDefault.set(text, forKey: "message")
        print(userDefault.object(forKey: "message"))
        self.performSegue(withIdentifier: "toView", sender: nil)
    }
    
    @IBAction private func cancel() {
        self.dismiss(animated: true)
    }
}

