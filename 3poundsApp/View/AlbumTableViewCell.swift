//
//  AlbumTableViewCell.swift
//  3poundsApp
//
//  Created by Ekrem Özkaraca on 24.02.2021.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
