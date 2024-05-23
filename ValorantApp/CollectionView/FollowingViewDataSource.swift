//
//  LiveViewDataSource.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 21/05/24.
//

import Foundation
import UIKit

class FollowingViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var matches: [FollowingSegment]
    
    init(matches: [FollowingSegment]) {
        self.matches = matches
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigFollowingViewCell.identifier, for: indexPath) as? BigFollowingViewCell else {
            fatalError("The CollectionView could not dequeue a CustomCell in ViewController.")
        }
      
        let match = self.matches[indexPath.row]
        
        cell.set(team_label: match.team, rank: match.rank, region: match.country, last_played: match.lastPlayed)
        cell.isUserInteractionEnabled = true
        
        cell.followButton.updateFocusIfNeeded()
        
        cell.followButton.tag = indexPath.row
//        cell.followButton.addTarget(self, action: #selector(self.onButtonPress(sender: )), for: .touchUpInside)
        cell.onButtonPressAction = {
            () in
            print("Tapped in cell", indexPath)
        }

        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
      return cell
    }
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return matches.count
  }
    
    
}


#Preview(){
    MainTabBarController()
}
