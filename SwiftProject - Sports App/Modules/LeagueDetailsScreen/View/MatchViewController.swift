//
//  MatchViewController.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 28/01/2024.
//

import UIKit

class MatchViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var upcomingEventsCollectionView: UICollectionView!
    var upcomingEvents : [Event]?
    
    @IBOutlet weak var latestEventsCollectionView: UICollectionView!
    var eventsCellID = "EventCell"
    var latestEvents : [Event]?
    
    @IBOutlet weak var clubsCollectionView: UICollectionView!
    var teamsCellID = "TeamCell"
    var clubs: [Team]?
    
    var leagueID: Int!
    
    var viewModelObject : LeagueDetailsViewModel?
    
//    @IBOutlet weak var allEventsCollectionView: UICollectionView!
//    let sportPhotos : [String] = ["Football","Basketball","Tennis","Cricket"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let Network = NetworkManager()
        viewModelObject = LeagueDetailsViewModel(networkHandler: Network, leagueID: leagueID)

        // Do any additional setup after loading the view.
        upcomingEventsCollectionView.register(UINib(nibName: "ResultsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "upcomingEvents")
        upcomingEventsCollectionView.dataSource = self
        upcomingEventsCollectionView.delegate = self
        
        latestEventsCollectionView.register(UINib(nibName: "ResultsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "LatestEvents")
        latestEventsCollectionView.dataSource = self
        latestEventsCollectionView.delegate = self
        
        if let layout = latestEventsCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
        
        clubsCollectionView.register(UINib(nibName: teamsCellID, bundle: nil), forCellWithReuseIdentifier: teamsCellID)
        clubsCollectionView.dataSource = self
        clubsCollectionView.delegate = self
        viewModelObject?.loadTeam()
        viewModelObject?.loadUpcomingEvents()
        viewModelObject?.loadLatestEvents()
        
                viewModelObject?.bindResultToViewController = { [weak self] in
                    DispatchQueue.main.async {
                        self?.clubs = self?.viewModelObject?.getTeams()
                        
                        self?.clubsCollectionView.reloadData()
                    
                    
                        self?.upcomingEvents = self?.viewModelObject?.getEvents()
                        self?.upcomingEventsCollectionView.reloadData()
                        self?.clubsCollectionView.reloadData()
                        
                       
                        self?.latestEvents = self?.viewModelObject?.getLatestEvents()
                        self?.latestEventsCollectionView.reloadData()
                    }
                }
        
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case upcomingEventsCollectionView:
            return upcomingEvents?.count ?? 0
        case latestEventsCollectionView:
            return latestEvents?.count ?? 0
        case clubsCollectionView:
            return clubs?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case upcomingEventsCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "upcomingEvents", for: indexPath) as! ResultsCollectionViewCell
            
            cell.imageFirstClub.kf.setImage(with: URL(string: upcomingEvents![indexPath.row].home_team_logo ?? " "), placeholder: UIImage(named: "placeholder"))
            cell.imageSecondClub.kf.setImage(with: URL(string: upcomingEvents![indexPath.row].away_team_logo ?? " "), placeholder: UIImage(named: "placeholder"))
            cell.nameFirstClub.text = upcomingEvents![indexPath.row].event_home_team
            cell.nameSecondClub.text = upcomingEvents![indexPath.row].event_away_team
            cell.dateOfMatch.text = upcomingEvents![indexPath.row].event_date
            cell.timeMatch.text = upcomingEvents![indexPath.row].event_time
            cell.resultMatch.text = " "
            
            return cell
            
        case latestEventsCollectionView: 
            
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "LatestEvents", for: indexPath) as! ResultsCollectionViewCell
            
            cell.imageFirstClub.kf.setImage(with: URL(string: latestEvents![indexPath.row].home_team_logo ?? " "), placeholder: UIImage(named: "placeholder"))
            cell.imageSecondClub.kf.setImage(with: URL(string: latestEvents![indexPath.row].away_team_logo ?? " "), placeholder: UIImage(named: "placeholder"))
            cell.nameFirstClub.text = latestEvents![indexPath.row].event_home_team
            cell.nameSecondClub.text = latestEvents![indexPath.row].event_away_team
            cell.dateOfMatch.text = latestEvents![indexPath.row].event_date
            cell.timeMatch.text = latestEvents![indexPath.row].event_time
            cell.resultMatch.text = latestEvents![indexPath.row].event_final_result
            
            return cell
            
            
            
        case clubsCollectionView:
            let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: teamsCellID, for: indexPath) as! TeamCell
            
            cell.teamLogo.kf.setImage(with: URL(string: clubs![indexPath.item].teamLogo ?? " "), placeholder: UIImage(named: "placeholder"))
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case upcomingEventsCollectionView:
            
            
            return CGSize(width: (UIScreen.main.bounds.width)-16, height: 160)
            
        case latestEventsCollectionView:
            
            
            
            return CGSize(width: (UIScreen.main.bounds.width/2)-16, height: 160)
            
        case clubsCollectionView:
            
            
            return CGSize(width: (UIScreen.main.bounds.width/3)-16, height: 100)
            
        default:
            return CGSizeZero
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == clubsCollectionView {
            let teamScreen = self.storyboard?.instantiateViewController(identifier: "TeamDetails") as! TeamDetailsViewController
            teamScreen.teamId = clubs?[indexPath.row].teamKey
            present(teamScreen, animated: true)
        }
    }
    
    
    
    @IBAction func BackToLeaguesListButton(_ sender: Any) {
        
        dismiss(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
