//
//  DetailsTableViewCell.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 24.02.2021.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var detailsImageView: UIImageView!
    @IBOutlet weak var detailsTitleLabel: UILabel!
    
    @IBOutlet weak var emailComment: UILabel!
    @IBOutlet weak var bodyComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        emailComment.isHidden = true
        bodyComment.isHidden = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
