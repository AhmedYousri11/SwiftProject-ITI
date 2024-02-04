//
//  ViewController.swift
//  SwiftProject - Sports App
//
//  Created by JETSMobileLabMini9 on 23/01/2024.
//

import UIKit
import Kingfisher

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var sportsTypeCollectionView: UICollectionView!
    var changeFromListedToGrid = true
    
    let sports : [String] = ["Football","Basketball","Tennis","Cricket"]


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sportsTypeCollectionView.dataSource = self
        sportsTypeCollectionView.delegate = self
        sportsTypeCollectionView.register(UINib(nibName: "SportsCell", bundle: nil), forCellWithReuseIdentifier: "Cell")

        if changeFromListedToGrid {
            self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "list.bullet")
        }else{
            self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "circle.grid.2x2.fill")
        }
        
        self.navigationItem.title = "Sports"
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SportsCell
        

        cell.sportImage.image = UIImage(named: sports[indexPath.row])
        cell.sportLabel.text = sports[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var size: CGSize!
        if changeFromListedToGrid {
            size =  CGSize(width: (UIScreen.main.bounds.width/2)-16, height: 160)
        }else{
            size =  CGSize(width: (UIScreen.main.bounds.width)-16, height: 160)
        }
        return size
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leaguesScreen = self.storyboard?.instantiateViewController(identifier: "Leagues") as! LeaguesTableViewController
        switch (indexPath.item){
        case 0:
            leaguesScreen.type=SportType.Football
            break
        case 1:
            leaguesScreen.type=SportType.BasketBall
            break
        case 2:
            leaguesScreen.type=SportType.Tennis
            break
        case 3:
            leaguesScreen.type=SportType.Cricket
            break
        default:
            break
        }
        
        present(leaguesScreen, animated: true)
    }
    
    
    @IBAction func changeLayoutButton(_ sender: Any) {
        changeFromListedToGrid = !changeFromListedToGrid
        
        if changeFromListedToGrid {
            self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "list.bullet")
        }else{
            self.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "circle.grid.2x2.fill")
        }
        sportsTypeCollectionView.collectionViewLayout.invalidateLayout()
        
        
    }
}

