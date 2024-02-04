//
//  LeagueDetailsViewModel.swift
//  SwiftProject - Sports App
//
//  Created by Mac on 03/02/2024.
//

import Foundation


class LeagueDetailsViewModel {
    
    var networkHandler:NetworkManager?
    var bindResultToViewController : (()->()) = {}
    var leagueID : Int?
    var result : [Team]?  {
        didSet{
            bindResultToViewController()
        }
    }
    var upcomingEvents : [Event]?  {
        didSet{
            bindResultToViewController()
        }
    }
    var latestEvents : [Event]?  {
        didSet{
            bindResultToViewController()
        }
    }
    
    init(networkHandler: NetworkManager?, leagueID: Int) {
        self.networkHandler = networkHandler
        self.leagueID = leagueID
    }
    
    func loadTeam(){
        networkHandler?.fetchResult(SportsUrl: "https://apiv2.allsportsapi.com/football/?met=Teams&leagueId=\(leagueID!)&APIkey=25fc7c64551ae1db877251383c94f9765521699801442b593a22c704a306c95f", type: GetTeams.self) { teams in
            
            
            self.result = teams?.result
            
            print( Team.self)
        }
    }
    
    func loadUpcomingEvents(){
        networkHandler?.fetchResult(SportsUrl: "https://apiv2.allsportsapi.com/football/?met=Fixtures&leagueId=\(leagueID!)&from=2024-01-31&to=2025-01-30&APIkey=25fc7c64551ae1db877251383c94f9765521699801442b593a22c704a306c95f", type: GetEvents.self) { teams in
            
            self.upcomingEvents = teams?.result
            print( Team.self)
            
        }
    }
    
    func loadLatestEvents(){
        networkHandler?.fetchResult(SportsUrl: "https://apiv2.allsportsapi.com/football/?met=Fixtures&leagueId=\(leagueID!)&from=2023-11-01&to=2024-01-31&APIkey=25fc7c64551ae1db877251383c94f9765521699801442b593a22c704a306c95f", type: GetEvents.self) { [self] teams in
            
            self.latestEvents = teams?.result
            
            print(Team.self)

          
        }
    }
    
    func getTeams()->[Team]{
        return result ?? []
        
    }
    
    func getEvents()->[Event]{
        return upcomingEvents ?? []
        
    }
    
    func getLatestEvents()->[Event]{
        return latestEvents ?? []
        
    }
    
}


