//
//  SportsType.swift
//  SwiftProject - Sports App
//
//  Created by Mac on 01/02/2024.
//


import Foundation

enum SportType {
    case Football
    case BasketBall
    case Cricket
    case Tennis
    
    var path : String {
        
        switch self {
        case .Football :
            return "football"
        case .BasketBall:
            return "basketball"
        case .Cricket:
            return "cricket"
        case .Tennis:
            return "tennis"
        }
    }
}
