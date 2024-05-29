//
//  UpcomingViewDelegate.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 15/05/24.
//

import Foundation
import UIKit

class FavoriteViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var matches: [FavoriteModel]
    
    init(matches: [FavoriteModel]) {
        self.matches = matches
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: 109)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout:  UICollectionViewLayout, insetForSectionAt: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 40, left: 0, bottom: 20, right: 0)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? UpcomingViewCell {
//            let match = self.matches[indexPath.row]
//            
//            self.matches.remove(at: indexPath.row)
//            collectionView.reloadData()
//            
//            DataController.shared.deleteMatch(match: match)
//            collectionView.deleteItems(at: [indexPath])
//        }
//        
//        collectionView.reloadData()
//        
//    }
    
    
}
