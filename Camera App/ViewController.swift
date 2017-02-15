//
//  ViewController.swift
//  Camera App
//
//  Created by Tauseef Kamal on 10/9/16.
//  Copyright © 2016 Tauseef Kamal. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var imageViewer: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //works only on a real device
    @IBAction func takePicture(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertView(title: "Error!",
                                    message: "No camera on this device!",
                                    delegate: nil,
                                    cancelButtonTitle: "OK")
            alert.show()
        }
    }
    
    @IBAction func showImages(_ sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertView(title: "Error!",
                                    message: "Photo library not accessible",
                                    delegate: nil,
                                    cancelButtonTitle: "OK")
            alert.show()
        }
        
    }
    
    //delegate function
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageViewer.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePhoto(_ sender: AnyObject) {
            let imageData = UIImageJPEGRepresentation(imageViewer.image!, 0.5)
        
            let compressedJPGImage = UIImage(data: imageData!)
        
            UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
            
            let alert = UIAlertView(title: "Info",
                                    message: "Image saved to Photo Library!",
                                    delegate: nil,
                                    cancelButtonTitle: "OK")
            alert.show()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

