//
//  TeamDataViewModel.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 04/02/2024.
//

import Foundation



class TeamDataViewModel{
    
    var networkHandler:NetworkManager?
    var bindResultToViewController : (()->()) = {}
    var result : [Team]?{
        didSet{
            bindResultToViewController()
        }
    }
    var teamId : Int!
    
    init(networkHandler: NetworkManager?, teamId: Int) {
        self.networkHandler = networkHandler
        self.teamId = teamId
    }
    
    
    func LoadTeamData(){
        networkHandler?.fetchResult(SportsUrl: "https://apiv2.allsportsapi.com/football/?met=Teams&teamId=\(teamId ?? 0)&APIkey=25fc7c64551ae1db877251383c94f9765521699801442b593a22c704a306c95f", type: GetTeams.self) { teams in
            
            
            self.result = teams?.result
            
            
        }
    }
    
    func getTeamData()->[Team]{
        return result ?? []
        
    }
}


