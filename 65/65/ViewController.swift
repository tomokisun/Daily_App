//
//  ViewController.swift
//  65
//
//  Created by 築山朋紀 on 2019/03/31.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

enum ImageType {
    case main
    case sub
}

class ViewController: UIViewController {
    
    @IBOutlet private weak var main1Label: UILabel!
    @IBOutlet private weak var main2Label: UILabel!
    @IBOutlet private weak var sub1Label: UILabel!
    @IBOutlet private weak var sub2Label: UILabel!
    
    @IBOutlet private weak var subButton: UIButton!
    @IBOutlet private weak var mainImageView: UIImageView!
    private var imageType: ImageType = .main

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func mainButtonDidTappend(_ sender: UIButton) {
        imageType = .main
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            self.present(picker, animated: true)
        }
    }
    
    @IBAction private func subButtonDidTappend(_ sender: UIButton) {
        imageType = .sub
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            self.present(picker, animated: true)
        }
    }

    @IBAction private func saveButtonDidTappend(_ sender: UIButton) {
        
    }
    
    @IBAction private func backButtonDidTappend(_ sender: UIButton) {
        main1Label.isHidden = false
        main2Label.isHidden = false
        sub1Label.isHidden = false
        sub2Label.isHidden = false
        mainImageView.image = UIImage()
        subButton.setImage(UIImage(named: "追加"), for: .normal)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        switch imageType {
        case .main:
            mainImageView.image = image
            main1Label.isHidden = true
            main2Label.isHidden = true
        case .sub:
            subButton.setImage(image, for: .normal)
            sub1Label.isHidden = true
            sub2Label.isHidden = true
        }
        dismiss(animated: true)
    }
}


