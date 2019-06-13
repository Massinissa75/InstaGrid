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
    let imgView = UIImage?.self
    
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
    @IBAction func shareOnlyImage(_ sender: UIButton) {
        let image = UIImage(named: "")
        let imageShare = [imagePick]
        
        let activityViewController = UIActivityViewController(activityItems: imageShare , applicationActivities: nil)
         activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
}

}




