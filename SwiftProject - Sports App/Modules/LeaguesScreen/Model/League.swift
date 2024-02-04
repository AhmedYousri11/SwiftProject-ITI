//
//  Movies.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 31/01/2024.
//

import Foundation


//class League:Codable {
//    
//    var league_key :Int?
//    var league_name :String?
//    var league_logo : String?
//    
//}


// MARK: - GetFootballLeagues
struct GetLeagues: Codable {
    let success: Int?
    let result: [League]?
}

// MARK: - Result
struct League: Codable {
    let leagueKey: Int?
    let leagueName: String?
    let leagueYear: String?
    let countryKey: Int?
    let countryName: String?
    let leagueLogo: String?
    let countryLogo: String?

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case leagueYear = "league_year"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }
}
