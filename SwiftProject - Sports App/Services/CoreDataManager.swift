//
//  CoreDataManager.swift
//  SwiftProject - Sports App
//
//  Created by Mac on 04/02/2024.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager{
    
    var coreDataArray : [NSManagedObject] = []
    
    var context : NSManagedObjectContext?
    
    var favLeague: NSManagedObject?
    
    init(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
        context = delegate.persistentContainer.viewContext
    }
    
    func saveToCoreData(league : League, sport : String) {
        let favouriteLeague = NSEntityDescription.entity(forEntityName: "FavouriteLeagueEntity", in: context!)
        
        let League = NSManagedObject(entity: favouriteLeague!, insertInto: context)
        League.setValue(league.leagueKey, forKey: "id")
        League.setValue(league.leagueName, forKey: "leagueName")
        League.setValue(league.leagueLogo ?? " ", forKey: "leagueLogo")
        League.setValue(sport, forKey: "sport")
        do{
            try context?.save()
            print("League Added to Favourites")
        }catch let error{
            print("Cannot Add League to Favourites")
            print(error.localizedDescription)
        }
        
    }
    
    
    func fetchData() {
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavouriteLeagueEntity")
        
        do{
            coreDataArray = try (context?.fetch(fetchRequest))!
            
        }catch let error{
            
            print(error.localizedDescription)
            
        }
      
    }
    func filterforSport(sport:String)-> [Int]{
        var filteredkeys : [Int] = []
        
        for favouriteLeagueObject in coreDataArray{
            if (favouriteLeagueObject.value(forKey: "sport") as! String) == sport{
                filteredkeys.append((favouriteLeagueObject.value(forKey: "id") as! Int))
            }
        }
        
        return filteredkeys
    }
    
    
    
    
    func deleteleagueFromCoreData(league : League, sport : String ){
        for favouriteLeagueObject in coreDataArray{
            if (favouriteLeagueObject.value(forKey: "id") as! Int) == league.leagueKey && (favouriteLeagueObject.value(forKey: "sport") as! String) == sport{
                context?.delete(favouriteLeagueObject)
                break
            }
        }
        
        do {
            try context?.save()
            print( "Deleted")
        }catch{
            print( "Cannot Delete")
        }
        
    }
    
    func getCoreData() -> [NSManagedObject]{
        return coreDataArray
    }
}


