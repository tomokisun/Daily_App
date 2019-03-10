//
//  ViewController.swift
//  44
//
//  Created by 築山朋紀 on 2019/03/10.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class DataTextField: UITextField {
    
    private var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .time
        picker.timeZone = NSTimeZone.local
        picker.locale = .current
        let minDateString = "00:00"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let minDate = dateFormatter.date(from: minDateString)
        picker.minimumDate = minDate
        return picker
    }()
    
    private func setUp() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBtn))
        toolBar.items = [toolBarButton]
        self.inputAccessoryView = toolBar
        self.inputView = datePicker
    }
    
    @objc func doneBtn() {
        self.endEditing(true)
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        self.text = "\(formatter.string(from: datePicker.date))"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var morningInput: UITextField!
    @IBOutlet private weak var showerInput: UITextField!
    @IBOutlet private weak var changeInput: UITextField!
    @IBOutlet private weak var appearanceInput: UITextField!
    @IBOutlet private weak var preparationInput: UITextField!
    @IBOutlet private weak var toStationInput: UITextField!
    @IBOutlet private weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func action() {
        guard let morning = Int(morningInput.text!) else { return }
        guard let shower = Int(showerInput.text!) else { return }
        guard let change = Int(changeInput.text!) else { return }
        guard let appearance = Int(appearanceInput.text!) else { return }
        guard let preparation = Int(preparationInput.text!) else { return }
        guard let station = Int(toStationInput.text!) else { return }
        
        let hoge = morning + shower + change + appearance + preparation + station
        
        label.text = "\(hoge)分前に起きましょう"
    }
    
}

