//
//  ProfileViewController.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 24.02.2021.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = "Ekrem"
        surnameLabel.text = "Özkaraca"
        emailLabel.text = "ekremozkaraca@gmail.com"
        
        profileImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        profileImageView.addGestureRecognizer(gestureRecognizer)
       
    }
    
    @objc func chooseImage(){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func facebookButtonClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.facebook.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func twitterButtonClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://twitter.com/")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func instagramButtonClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.instagram.com")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func linkedinButtonClicked(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.linkedin.com")! as URL, options: [:], completionHandler: nil)
    }
    
}
