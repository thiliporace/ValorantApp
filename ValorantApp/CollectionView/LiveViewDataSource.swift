//
//  LiveViewDataSource.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 21/05/24.
//

import Foundation
import UIKit

class LiveViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var matches: [LiveSegment]
    
    init(matches: [LiveSegment]) {
        self.matches = matches
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LiveViewCell.identifier, for: indexPath) as? LiveViewCell else {
            fatalError("The CollectionView could not dequeue a CustomCell in ViewController.")
        }
      
        let match = self.matches[indexPath.row]
        var team1_round: String = ""
        var team2_round: String = ""
        
        if self.matches[indexPath.row].team1RoundCT == "N/A"{
            team1_round = self.matches[indexPath.row].team1RoundT
        }
        else if self.matches[indexPath.row].team1RoundT == "N/A"{
            team1_round = self.matches[indexPath.row].team1RoundCT
        }
        
        if self.matches[indexPath.row].team2RoundCT == "N/A"{
            team2_round = self.matches[indexPath.row].team2RoundT
        }
        else if self.matches[indexPath.row].team2RoundT == "N/A"{
            team2_round = self.matches[indexPath.row].team2RoundCT
        }
        
        cell.set(seriesLabel: match.matchSeries, current_map: match.currentMap, map_number: match.mapNumber, team1_round: team1_round, team2_round: team2_round, score1: match.score1, score2: match.score2, country_flag1: match.flag1, country_flag2: match.flag2, team_name1: match.team1, team_name2: match.team2)

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
