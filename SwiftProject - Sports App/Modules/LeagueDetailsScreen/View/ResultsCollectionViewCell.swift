//
//  ResultsCollectionViewCell.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 30/01/2024.
//

import UIKit
import Kingfisher

class ResultsCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var imageFirstClub: UIImageView!
    @IBOutlet weak var nameFirstClub: UILabel!
    @IBOutlet weak var timeMatch: UILabel!
    @IBOutlet weak var nameSecondClub: UILabel!
    @IBOutlet weak var imageSecondClub: UIImageView!
    @IBOutlet weak var dateOfMatch: UILabel!
    @IBOutlet weak var resultMatch: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        background.clipsToBounds = true
        background.layer.cornerRadius = background.frame.height / 10
        
    }
    
}


