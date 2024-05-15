//
//  UpcomingViewDataSource.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 15/05/24.
//

import Foundation
import UIKit

class UpcomingViewDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate{
    
    var array: [String]
    
    init(array: [String]) {
        self.array = array
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingViewCell.identifier, for: indexPath) as? UpcomingViewCell else {
            fatalError("The CollectionView could not dequeue a CustomCell in ViewController.")
        }
      
        cell.set(seriesLabel: "view", date: "view", country_flag1: "flag_cn", country_flag2: "flag_cn", team_name1: "fun plus phoenx", team_name2: "fun plus phoenix ", game_time: "view", time_from_now: "view")
//        cell.backgroundColor = .yellow
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
//        cell.addSubview(upcomingCard)
      return cell
    }
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return array.count
  }
}

#Preview(){
    MainTabBarController()
}
