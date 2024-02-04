//
//  FavouriteLeaguesTableViewController.swift
//  SwiftProject - Sports App
//
//  Created by Mac on 04/02/2024.
//

import UIKit
import CoreData
import Kingfisher

class FavouriteLeaguesTableViewController: UITableViewController {

    var favouriteLeagues : [NSManagedObject]?
    
    var viewModel : FavouriteLeagueViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = FavouriteLeagueViewModel()
        tableView.register(UINib(nibName: "LeagueNamesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavouriteLeagueCell")
        
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return favouriteLeagues?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteLeagueCell", for: indexPath) as! LeagueNamesTableViewCell
        
        cell.LeagueLabel.text = (favouriteLeagues?[indexPath.row].value(forKey: "leagueName") as! String)
        cell.LeagueImage.kf.setImage(with: URL(string: (favouriteLeagues?[indexPath.row].value(forKey: "leagueLogo") as! String) ?? " "))


        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel?.loadFavouriteLeague()
        favouriteLeagues = viewModel?.getFavouriteLeagues()
        
        tableView.reloadData()
        
        print( favouriteLeagues)
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let matchesScreen = storyboard?.instantiateViewController(withIdentifier: "Matches") as! MatchViewController
        matchesScreen.leagueID = (favouriteLeagues?[indexPath.row].value(forKey: "id") as! Int)
        matchesScreen.favourite = true
        matchesScreen.sportType = (favouriteLeagues?[indexPath.row].value(forKey: "sport") as! String)
        matchesScreen.leagueReference = viewModel?.revertKey(leagueManagedObject:(favouriteLeagues?[indexPath.row])!)
        
        present(matchesScreen, animated: true)
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
