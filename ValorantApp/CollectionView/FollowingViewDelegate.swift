//
//  LiveViewDelegate.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 21/05/24.
//

import Foundation
import UIKit

class FollowingViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var dataSource: UICollectionViewDataSource
    
    var selectedBool: Bool = false
    
    init(dataSource: UICollectionViewDataSource) {
        self.dataSource = dataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
    func collectionView(_ collectionView: UICollectionView, layout:  UICollectionViewLayout, insetForSectionAt: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 80, left: 0, bottom: 20, right: 0)
    }
    
    private func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BigFollowingViewCell.identifier, for: indexPath) as? BigFollowingViewCell else {
//            fatalError("The CollectionView could not dequeue a CustomCell in ViewController.")
//        }
//        
//        if !(selectedBool){
//            cell.onButtonPress(selectedBool: selectedBool)
//            selectedBool.toggle()
//        }
//        else {
//            cell.onButtonPress(selectedBool: selectedBool)
//            selectedBool.toggle()
//        }
//        
//        collectionView.performBatchUpdates {
//            collectionView.reloadItems(at: [indexPath])
//        }
//       
////        collectionView.reloadData()
//    }
    
    
}
