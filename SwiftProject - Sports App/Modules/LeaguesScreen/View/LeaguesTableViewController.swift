//
//  LeaguesTableViewController.swift
//  SwiftProject - Sports App
//
//  Created by Mac on 27/01/2024.
//

import UIKit
import Kingfisher

class LeaguesTableViewController: UITableViewController {

    var leagues : [League]?
    var type : SportType!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initTableView()
        
        print(type.path)

        let Network = NetworkManager()
        Network.fetchResult(SportsUrl: "https://apiv2.allsportsapi.com/\(type.path)/?met=Leagues&APIkey=25fc7c64551ae1db877251383c94f9765521699801442b593a22c704a306c95f", type: GetLeagues.self) { leagues in
            self.leagues = leagues?.result
//            print(leagues)
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
            }
        }
        
      
    }

    func initTableView(){
        tableView.register(UINib(nibName: "LeagueNamesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeagueCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leagues?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell") as! LeagueNamesTableViewCell
        cell.LeagueLabel.text = leagues?[indexPath.row].leagueName ?? "Premier league"
//        cell.LeagueImage.kf.setImage(with: URL(string:leagues?[indexPath.row].leagueLogo ??  "https://mercatofootanglais.com/wp-content/uploads/2019/07/new-premier-league-logo-2016-17-8-1200x615.jpg.webp"))
        cell.setImage(url: leagues![indexPath.row].leagueLogo ?? "", type: type.path)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchesScreen = storyboard?.instantiateViewController(withIdentifier: "Matches") as! MatchViewController
        matchesScreen.leagueID = leagues![indexPath.row].leagueKey
        present(matchesScreen, animated: true)
    }
    
    @IBAction func backtoHomeScreenButton(_ sender: Any) {
        dismiss(animated: true)
    }
    

    
}
