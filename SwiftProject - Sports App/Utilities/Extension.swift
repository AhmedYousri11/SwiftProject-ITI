//
//  Extension.swift
//  SwiftProject - Sports App
//
//  Created by Mac on 03/02/2024.
//

import Foundation
import UIKit

extension UIImageView{
    func roundedImage(){
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
    }
    func borderImage(){
        self.layer.cornerRadius = self.frame.size.width/10
        self.clipsToBounds = true
    }
    
    
}
