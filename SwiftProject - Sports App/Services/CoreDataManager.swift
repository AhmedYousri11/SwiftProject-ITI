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
    
    var coreDataArray : [NSManagedObject]?
    
    var context : NSManagedObjectContext?
    
    init(){
        let delegate = UIApplication.shared.delegate as! AppDelegate
       // context = delegate.persistentContainer.viewContextt
    }
    
    
}
