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
    
    var favouriteLeague : [Int]?
    
    var viewModel : LeagueViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Network = NetworkManager()
       viewModel = LeagueViewModel(networkHandler: Network)
        favouriteLeague = viewModel?.returnFavouritekeys(type: type)
        initTableView()
        
        print(type.path)
        
        viewModel?.loadLeagues(type: type)
        viewModel?.bindResultToViewController = {
             
            self.leagues = self.viewModel?.getLeagues()
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
        matchesScreen.favourite = favouriteLeague?.contains((leagues![indexPath.row].leagueKey)!)
        matchesScreen.sportType = type.path
        matchesScreen.leagueReference = leagues![indexPath.row]
        
        present(matchesScreen, animated: true)
    }
    
    @IBAction func backtoHomeScreenButton(_ sender: Any) {
        dismiss(animated: true)
    }
    

    
}
