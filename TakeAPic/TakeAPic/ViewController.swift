//
//  ViewController.swift
//  TakeAPic
//
//  Created by Ashish Ashish on 4/4/22.
//

import UIKit

/*
 Steps for localization:
 
 1. Add a Localizable.strings file
 2. Click on Localizable on the right menu for the localizable file
 3. Click on Project in the left side top -> click on Project -> Info
 4. Add the language you want from the localizable
 5. Your localizable file would add that language file
 6. Create key value pair for all the strings you need to localize for e.g. "take_pic" = "Take a Picture";
 7. "take_pic" = "拍照";
 8. remember to add a semi colon to the end of the key value pair
 9. Create a Utilities folder and add a swift file called LocalizationUtil.swift
 10. create variable for the key like following var strTakePic = NSLocalizedString("take_pic", comment: "")

 11. In the viewDidLoad or a separate function get the localized string and set the title asd following btnTakePic.setTitle(strTakePic, for: .normal)

 12. Change the language from Settings -> General -> Language and region -> Language to any other language
 13 Run the app and see if the button/ui element is localized or not
 
 */


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var btnTakePic: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnTakePic.setTitle(strTakePic, for: .normal)

    }

    @IBAction func takeAPictureAction(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "Take a Picture", message: "Select Image fromn Library or take a picture", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true, completion: nil)
            }
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            print("Cancel")
        }
        
        alertController.addAction(cameraAction)
        alertController.addAction(libraryAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            picker.dismiss(animated: true, completion: nil)
            return
        }
        
        imgView.image = image
        picker.dismiss(animated: true, completion: nil)
        
    }
    
}

