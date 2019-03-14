//
//  ViewController.swift
//  48
//
//  Created by 築山朋紀 on 2019/03/14.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var redLabel: UILabel!
    @IBOutlet private weak var greenLabel: UILabel!
    @IBOutlet private weak var blueLabel: UILabel!
    @IBOutlet private weak var baseView: UIView!
    
    var red: CGFloat = 1 {
        didSet {
            setColor()
        }
    }
    var green: CGFloat = 1 {
        didSet {
            setColor()
        }
    }
    var blue: CGFloat = 1 {
        didSet {
            setColor()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let u = UIColor.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    }
    
    private func setColor() {
        baseView.backgroundColor = UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    @IBAction private func redSlide(sender: UISlider) {
        red = CGFloat(sender.value)
        redLabel.text = "\(sender.value)/255"
    }
    @IBAction private func greenSlide(sender: UISlider) {
        green = CGFloat(sender.value)
        greenLabel.text = "\(sender.value)/255"
    }
    @IBAction private func blueSlide(sender: UISlider) {
        blue = CGFloat(sender.value)
        blueLabel.text = "\(sender.value)/255"
    }
}

