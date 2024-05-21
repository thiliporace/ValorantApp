//
//  LiveViewCell.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 20/05/24.
//

import Foundation
import UIKit

class LiveViewCell: UICollectionViewCell {
    
    static let identifier = "LiveViewCell"
    
    var seriesLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var live_label: UILabel = {
        let label = UILabel()
        
        
        
        return label
    }()
    
    var live_system_image: UIImageView = {
        let image = UIImage(systemName: "record.circle.fill")
        let newImage = UIImageView(image: image)
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.tintColor = .mainRed
        
        return newImage
    }()
    
    var country_flag1: UILabel = {
        let image = UILabel()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.font = UIFont.systemFont(ofSize: 20)
        
        return image
    }()
    
    var country_flag2: UILabel = {
        let image = UILabel()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.font = UIFont.systemFont(ofSize: 20)
        
        return image
    }()
    
    var map_name: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 12)
        label.textColor = .customTextGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var current_map: UIImageView = {
        let image = UIImageView()
        
        
        
        return image
    }()
    
    var team1_round: UILabel = {
       let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var team2_round: UILabel = {
       let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var score_text: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 14)
        label.textColor = .customTextGray
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var team_name1: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var team_name2: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var topRectangle: UIImageView = {
        var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 354, height: 38))
        
        image.backgroundColor = .customLightGray
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var bottomRectangle: UIImageView = {
        var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 354, height: 71))
        
        image.backgroundColor = .customDarkGray
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    func addEmoji(string: String) -> String{
        var newString: String = ""
        switch string{
        case "flag_au": newString = "🇦🇺"
        case "flag_bd": newString = "🇧🇩"
        case "flag_br": newString = "🇧🇷"
        case "flag_ca": newString = "🇨🇦"
        case "flag_cl": newString = "🇨🇱"
        case "flag_cn": newString = "🇨🇳"
        case "flag_co": newString = "🇨🇴"
        case "flag_de": newString = "🇩🇪"
        case "flag_eu": newString = "🇪🇺"
        case "flag_fr": newString = "🇫🇷"
        case "flag_in": newString = "🇮🇳"
        case "flag_it": newString = "🇮🇹"
        case "flag_mx": newString = "🇲🇽"
        case "flag_un": newString = "🇺🇳"
        case "flag_us": newString = "🇺🇸"
        case "flag_vn": newString = "🇻🇳"
        case "flag_es": newString = "🇪🇸"
        case "flag_sa": newString = "🇸🇦"
        case "flag_co": newString = "🇦🇺"
        case "flag_gb": newString = "🇬🇧"
        case "flag_ar": newString = "🇦🇷"
        case "flag_jp": newString = "🇯🇵"
        case "flag_kr": newString = "🇰🇷"
        case "flag_tr": newString = "🇹🇷"
        case "flag_pl": newString = "🇵🇱"
        default:
            newString = "🌐"
        }
        return newString
    }
    
    func set(seriesLabel: String, current_map: String, map_number: String, team1_round: String, team2_round: String, score1: String, score2: String, country_flag1: String, country_flag2: String, team_name1: String, team_name2: String){
        self.seriesLabel.text = seriesLabel
        self.current_map.image = UIImage(named: current_map)
        self.map_name.text = String("Map \(map_number) - \(current_map)")
        self.team1_round.text = team1_round
        self.team2_round.text = team2_round
        self.score_text.text = String("\(score1)-\(score2)")
        self.country_flag1.text = addEmoji(string: country_flag1)
        self.country_flag2.text = addEmoji(string: country_flag2)
        self.team_name1.text = team_name1
        self.team_name2.text = team_name2
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        set(seriesLabel: "Regular Week: Round 1", current_map: "Icebox", map_number: "1", team1_round: "12", team2_round: "3", score1: "0", score2: "0", country_flag1: "flag_cn", country_flag2: "flag_br", team_name1: "Fun Plus Phoenix", team_name2: "KRU Esports")
        addElements()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements(){
        
    }
}
