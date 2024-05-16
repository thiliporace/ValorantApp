//
//  UpcomingViewDataSource.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 15/05/24.
//

import Foundation
import UIKit

class UpcomingViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var matches: [UpcomingSegment]
    
    init(matches: [UpcomingSegment]) {
        self.matches = matches
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingViewCell.identifier, for: indexPath) as? UpcomingViewCell else {
            fatalError("The CollectionView could not dequeue a CustomCell in ViewController.")
        }
      
        let match = self.matches[indexPath.row]
        cell.set(seriesLabel: match.matchSeries, date: match.unixTimestamp, country_flag1: match.flag1, country_flag2: match.flag2, team_name1: match.team1, team_name2: match.team2, game_time: match.unixTimestamp, time_from_now: match.timeUntilMatch)
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
