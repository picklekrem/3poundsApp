//
//  PopUpViewController.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 25.02.2021.
//

import UIKit
import SDWebImage

class PopUpViewController: UIViewController {

    @IBOutlet weak var popUpId: UILabel!
    @IBOutlet weak var popUpAlbumId: UILabel!
    @IBOutlet weak var popUpTitleLabel: UILabel!
    @IBOutlet weak var popUpImageView: UIImageView!
    
    var selectedPopUpId = ""
    var selectedPopUpAlbumId = ""
    var selectedPopUpTitleLabel = ""
    var selectedPopUpImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageURL = URL(string: "\(selectedPopUpImage)")
        popUpAlbumId.text = selectedPopUpAlbumId
        popUpId.text = selectedPopUpId
        popUpTitleLabel.text = selectedPopUpTitleLabel
        popUpImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
    }

    @IBAction func popUpButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
