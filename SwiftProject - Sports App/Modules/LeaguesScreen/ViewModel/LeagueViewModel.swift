//
//  LeagueViewModel.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 30/01/2024.
//

import Foundation

class LeagueViewModel{
    var coreData : CoreDataManager?
    var networkHandler:NetworkManager?
    var bindResultToViewController : (()->()) = {}
    var result : [League]?  {
        didSet{
            bindResultToViewController()
        }
    }
    
    init(networkHandler: NetworkManager?) {
        self.networkHandler = networkHandler
        
        self.coreData = CoreDataManager()
        
        coreData?.fetchData()
    }
    
    func loadLeagues(type : SportType){
        networkHandler?.fetchResult(SportsUrl: "https://apiv2.allsportsapi.com/\( type.path)/?met=Leagues&APIkey=25fc7c64551ae1db877251383c94f9765521699801442b593a22c704a306c95f", type: GetLeagues.self) { teams in
            
            
            self.result = teams?.result
            
            
        }
        coreData?.fetchData()
    }
    
    func returnFavouritekeys(type : SportType) -> [Int]{
        return (coreData?.filterforSport(sport: type.path))!
    }
    
    func getLeagues()->[League]{
        return result ?? []
        
    }
}
