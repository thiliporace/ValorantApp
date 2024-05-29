//
//  UpcomingViewDelegate.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 15/05/24.
//

import Foundation
import UIKit

class UpcomingViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var matches: [UpcomingSegment]
    
    var selectedIndexPath = IndexPath()
    
    var dataSource: UICollectionViewDataSource
    
    init(matches: [UpcomingSegment], dataSource: UICollectionViewDataSource) {
        self.matches = matches
        self.dataSource = dataSource
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
        return UIEdgeInsets(top: 80, left: 0, bottom: 20, right: 0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.allowsMultipleSelection = false
        
       
        if let cell = collectionView.cellForItem(at: indexPath) as? UpcomingViewCell {
            
            collectionView.allowsMultipleSelection = false
            
            let match = self.matches[indexPath.row]
            let timestamp = self.matches[indexPath.row].unixTimestamp
            let messageSplit = timestamp.split(separator: " ")
            let messagePrefix = String(messageSplit.first ?? "")
            let messageSufix = String(messageSplit.last ?? "")
            let dateSufix = messageSufix.split(separator: ":")
            
            let daySplit = messagePrefix.split(separator: "-")
            let day = daySplit[2]
            
            var timeSubtracted = Int(dateSufix[0])! - 3
            switch timeSubtracted{
            case -3:
                timeSubtracted = 21
            case -2:
                timeSubtracted = 22
            case -1:
                timeSubtracted = 23
            default:
                break
            }
            
            let newTime = String(timeSubtracted)
            
            let newDateSufix = String(newTime + ":" + dateSufix[1])
            
            let request: UNNotificationRequest
            
            request = sendNotification(team1: match.team1, team2: match.team2, championship: match.matchEvent, series: match.matchSeries, day: Int(day)!, hour: Int(newTime)!, minutes: Int(dateSufix[1])!)
//            request = sendNotification(team1: match.team1, team2: match.team2, championship: match.matchEvent, series: match.matchSeries, day: 27, hour: 14, minutes: 57)
            
            if !(cell.isSelectedBool){
                cell.bellButton.image = UIImage(systemName: "bell.fill")
                cell.isSelectedBool = true
                DataController.shared.createMatch(seriesLabel: match.matchSeries, date: messagePrefix, country_flag1: match.flag1, country_flag2: match.flag2, team_name1: match.team1, team_name2: match.team2, game_time: newDateSufix, time_from_now: match.timeUntilMatch)
                
                DataController.shared.saveContext()
                
                UNUserNotificationCenter.current().add(request)
            }
            else{
                cell.bellButton.image = UIImage(systemName: "bell")
                cell.isSelectedBool = false
                
                UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [String(newTime + dateSufix[1])])
            }
           
            collectionView.reloadItems(at: [indexPath])

        }

    }
    
    
    func sendNotification(team1: String, team2: String, championship: String, series: String, day: Int, hour: Int, minutes: Int) -> UNNotificationRequest{
        let content = UNMutableNotificationContent()

        content.title = "\(team1) vs. \(team2) begins"
        
        content.subtitle = "in 1 hour!"
        
        content.body = "\(championship) \(series)"
        
        content.sound = UNNotificationSound.default
        
        var date = DateComponents()
       
        date.day = day
        date.hour = hour - 1
        date.minute = minutes
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        
        let request = UNNotificationRequest(identifier: String(hour + minutes), content: content, trigger: trigger)
        
        return request
    }
    
}
