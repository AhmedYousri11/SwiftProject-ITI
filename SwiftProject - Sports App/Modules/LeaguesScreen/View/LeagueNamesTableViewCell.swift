//
//  LeagueNamesTableViewCell.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 28/01/2024.
//

import UIKit
import Kingfisher

class LeagueNamesTableViewCell: UITableViewCell {

    @IBOutlet weak var LeaguesContatiner: UIView!
    @IBOutlet weak var LeagueImage: UIImageView!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var LeagueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        LeagueImage.layer.cornerRadius = LeagueImage.bounds.size.width / 2
        LeaguesContatiner.layer.cornerRadius = 15
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setImage(url: String, type: String){
        if type == "football" {
            LeagueImage.kf.setImage(with: URL(string:url), placeholder: UIImage(named: "placeholder"))
            imageWidth.constant = 50
        }else{
            imageWidth.constant = 0
        }
    }
}
