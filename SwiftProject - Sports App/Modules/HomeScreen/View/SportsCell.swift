//
//  SportsCell.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 31/01/2024.
//

import UIKit

class SportsCell: UICollectionViewCell {

    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sportImage.layer.cornerRadius = 20
    }
    
}
