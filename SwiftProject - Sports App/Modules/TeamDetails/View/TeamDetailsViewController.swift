//
//  TeamDetailsViewController.swift
//  SwiftProject - Sports App
//
//  Created by Mac on 04/02/2024.
//

import UIKit
import Kingfisher

class TeamDetailsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return club?[0].players?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllPlayers" ) as! PlayersTableViewCell
       cell.PlayerNameLabel.text = self.club?[0].players?[indexPath.row].playerName
       cell.PlayerImage.kf.setImage(with: URL(string: club?[0].players?[indexPath.item].playerImage ?? " "), placeholder: UIImage(named: "placeholder"))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
   
    
   @IBOutlet weak var TeamLogo: UIImageView!
    
    @IBOutlet weak var PlayersTable: UITableView!
    
    
    var viewModelObject : TeamDataViewModel?
    
    var club: [Team]?
    
    var teamId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PlayersTable.dataSource = self
        PlayersTable.delegate = self
        
        PlayersTable.register(UINib(nibName: "PlayersTableViewCell", bundle: nil), forCellReuseIdentifier: "AllPlayers")
        let Network = NetworkManager()
        viewModelObject = TeamDataViewModel(networkHandler: Network, teamId: teamId ?? 0)
        viewModelObject?.LoadTeamData()
        
        viewModelObject?.bindResultToViewController = { [weak self] in
            DispatchQueue.main.async {
                self?.club = self?.viewModelObject?.getTeamData()
                self?.TeamLogo.kf.setImage(with: URL(string: ((self?.club?[0].teamLogo ?? "") as String)))
                self?.PlayersTable.reloadData()
                
            }
            
        }
        
        
        
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
            
            
        }
     
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//           
//        }
//        
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}
