//
//  UpcomingViewDataSource.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 15/05/24.
//

import Foundation
import UIKit
import CoreData

class FavoriteViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var matches: [FavoriteModel]
    
    init(matches: [FavoriteModel]) {
        self.matches = matches
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingViewCell.identifier, for: indexPath) as? UpcomingViewCell else {
            fatalError("The CollectionView could not dequeue a CustomCell in ViewController.")
        }
      
        let match = self.matches[indexPath.row]
        
        collectionView.allowsMultipleSelection = false
        
        cell.set(seriesLabel: match.seriesLabel ?? "", date: match.date ?? "", country_flag1: match.country_flag1 ?? "", country_flag2: match.country_flag2 ?? "", team_name1: match.team_name1 ?? "", team_name2: match.team_name2 ?? "", game_time: match.game_time ?? "", time_from_now: match.time_from_now ?? "")
        
//        cell.bellButton.image = UIImage(systemName: "trash.fill")
        cell.bellButton.image = UIImage(systemName: "")
        cell.bellButton.tintColor = .mainRed
//        cell.backgroundColor = .yellow
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
//        cell.addSubview(upcomingCard)
      return cell
    }
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return matches.count
  }
}

#Preview(){
    MainTabBarController()
}
