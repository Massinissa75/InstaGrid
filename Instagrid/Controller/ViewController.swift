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

    // Differents outlets
    
    @IBOutlet weak var arrowIcon: UIImageView!
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
        
        setLayout(layout: 2)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            LabelShare.text = "Swipe left to share"
            arrowIcon.image = UIImage(named: "Arrow Left")
        } else {
            LabelShare.text = "Swipe up to share"
            arrowIcon.image = UIImage(named: "Arrow Up")
        }
    }
        
    // Sharing function
    
    func sharing(_sender: Any){
        
        let imageShare = [gridView.image]
        let activityVC = UIActivityViewController(activityItems: imageShare as [Any], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    //Swipe up to share
    
    @IBAction func swipeUp(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isPortrait{
        sharing(_sender: UISwipeGestureRecognizer.self)
        }
    }
    
    //Swipe left to share
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape{
        sharing(_sender: UISwipeGestureRecognizer.self)
        }
    }
    
    
    //Select and add an image from library
    
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
    
    //Select layout function
    
    @IBAction func chooseLayout(_sender: UIButton){
        
        setLayout(layout: _sender.tag)
    }
    func setLayout(layout: Int){
        
        if (layout == 0){
            butn1.isHidden = true
            Butn2.isHidden = false
            Butn3.isHidden = false
            Butn4.isHidden = false
            
            layout1.setImage(UIImage(named: "Selected"), for: .normal)
            layout2.setImage(nil, for: .normal)
            layout3.setImage(nil, for: .normal)
            
        } else if (layout == 1){
            Butn3.isHidden = true
            butn1.isHidden = false
            Butn2.isHidden = false
            Butn4.isHidden = false
            
            layout2.setImage(UIImage(named: "Selected"), for: .normal)
            layout1.setImage(nil, for: .normal)
            layout3.setImage(nil, for: .normal)
            
        }else{
            butn1.isHidden = false
            Butn2.isHidden = false
            Butn3.isHidden = false
            Butn4.isHidden = false
            
            layout3.setImage(UIImage(named: "Selected"), for: .normal)
            layout2.setImage(nil, for: .normal)
            layout1.setImage(nil, for: .normal)
        }
    }
}
