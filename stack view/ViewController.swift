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

  
    @IBOutlet weak var layout1: UIButton!
    @IBOutlet weak var layout2: UIButton!
    @IBOutlet weak var layout3: UIButton!
    
    @IBOutlet weak var LabelShare: UILabel!
    
    @IBOutlet weak var gridView: UIView!
    
    @IBOutlet weak var butn1: UIButton!
    @IBOutlet weak var Butn2: UIButton!
    @IBOutlet weak var Butn3: UIButton!
    @IBOutlet weak var Butn4: UIButton!
    
    override func viewDidLoad() {
        
        _ = UISwipeGestureRecognizer(target: self, action: #selector(swipingUp(_:)))
        
    }
        
        
    @IBAction func swipingUp(_ sender: UISwipeGestureRecognizer) {
        sharing(_sender: UISwipeGestureRecognizer.self)
      
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
            
            layout1.imageView?.isHidden = false
            layout2.imageView?.isHidden = true
            layout3.imageView?.isHidden = true
            
        } else if (_sender.tag == 1){
            Butn3.isHidden = true
            butn1.isHidden = false
            Butn2.isHidden = false
            Butn4.isHidden = false
            
            layout1.imageView?.isHidden = true
            layout2.imageView?.isHidden = false
            layout3.imageView?.isHidden = true
            
        }else{
            butn1.isHidden = false
            Butn2.isHidden = false
            Butn3.isHidden = false
            Butn4.isHidden = false
            
            layout1.imageView?.isHidden = true
            layout2.imageView?.isHidden = true
            layout3.imageView?.isHidden = false
        }
    }
    
    func sharing(_sender: Any){
        
        let imageShare = [gridView.image]
        let activityVC = UIActivityViewController(activityItems: imageShare as [Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
 
}
