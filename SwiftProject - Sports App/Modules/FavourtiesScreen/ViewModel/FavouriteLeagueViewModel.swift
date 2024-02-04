//
//  FavouriteLeagueViewModel.swift
//  SwiftProject - Sports App
//
//  Created by Mac on 04/02/2024.
//

import Foundation
import CoreData


class FavouriteLeagueViewModel{
    
    var coreData : CoreDataManager?
  
    
    var leagueID : Int?
    var result : [NSManagedObject]?
    
    init() {
        
       
        self.coreData = CoreDataManager()
        
        
    }
    
    func loadFavouriteLeague(){
        
        coreData?.fetchData()
        
        result = coreData?.getCoreData()
    }
    
   
    func getFavouriteLeagues()->[NSManagedObject]{
        
        return result ?? []
        
    }
    
    
    func revertKey(leagueManagedObject: NSManagedObject)-> League{
        var storedLeague = League(leagueKey: (leagueManagedObject.value(forKey: "id") as! Int), leagueName: (leagueManagedObject.value(forKey: "leagueName") as! String), leagueYear: "", countryKey: 0, countryName: "", leagueLogo: (leagueManagedObject.value(forKey: "leagueLogo") as! String), countryLogo: "")
        
        
        
        return storedLeague
        
    }
    
    
}
