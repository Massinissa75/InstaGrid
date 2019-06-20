//
//  ViewController.swift
//  stack view
//
//  Created by Massinissa_theking on 06/06/2019.
//  Copyright © 2019 Massinissa_theking. All rights reserved.
//

import UIKit
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    
    let imagePick = UIImagePickerController()
    var currentButton: UIButton?
    var imgView = UIImage?.self

    
    @IBOutlet weak var butn1: UIButton!
    @IBOutlet weak var Butn2: UIButton!
    @IBOutlet weak var Butn3: UIButton!
    @IBOutlet weak var Butn4: UIButton!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func addImageButton(_ sender: UIButton) {
        
        currentButton = sender
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        if let button = currentButton {
            button.setImage(image, for: .normal)
            button.imageView?.contentMode = .scaleAspectFill
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseLayout(_sender: UIButton){
        if (_sender.tag == 0){
            butn1.isHidden = true
            Butn2.isHidden = false
            Butn3.isHidden = false
            Butn4.isHidden = false
        } else if (_sender.tag == 1){
            Butn3.isHidden = true
            butn1.isHidden = false
            Butn2.isHidden = false
            Butn4.isHidden = false
        }else{
            butn1.isHidden = false
            Butn2.isHidden = false
            Butn3.isHidden = false
            Butn4.isHidden = false
        }
    }
}
