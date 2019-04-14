//
//  ViewController.swift
//  79
//
//  Created by 築山朋紀 on 2019/04/14.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class Model {
    let title: String
    let date: String
    
    init(title: String, date: String) {
        self.title = title
        self.date = date
    }
    
    init() {
        self.title = ""
        self.date = ""
    }
}

var model = Model()

class ViewController: UIViewController {
    
    @IBOutlet private weak var daysLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.titleLabel.text = model.title
        self.daysLabel.text = model.date
    }
}


class SecondViewController: UIViewController {
    
    @IBOutlet private weak var titleTextInput: UITextField!
    @IBOutlet private weak var dateTextInput: UITextField!
    private var datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayoutDatePicker()
    }
    
    @IBAction private func didButtonTappend(_ sender: UIButton) {
        let title = titleTextInput.text!
        let date = dateTextInput.text!
        
        if !title.isEmpty, !date.isEmpty {
            model = Model(title: title, date: date)
            self.dismiss(animated: true)
        }
    }
    
    private func setLayoutDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.timeZone = NSTimeZone.local
        datePicker.locale = .current
        
        let minDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        datePicker.minimumDate = minDate
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 35))
        let spacelItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(done))
        toolbar.setItems([spacelItem, doneItem], animated: true)
        
        dateTextInput.inputView = datePicker
        dateTextInput.inputAccessoryView = toolbar
    }
    
    @objc func done() {
        dateTextInput.endEditing(true)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        dateTextInput.text = "\(formatter.string(from: datePicker.date))"
    }
}
