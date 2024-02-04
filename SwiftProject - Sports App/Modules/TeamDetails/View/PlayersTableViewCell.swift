//
//  PlayersTableViewCell.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 04/02/2024.
//

import UIKit
import Kingfisher

class PlayersTableViewCell: UITableViewCell {

  
    
    @IBOutlet weak var PlayerImage: UIImageView!
    @IBOutlet weak var PlayerNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
