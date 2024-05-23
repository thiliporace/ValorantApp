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
    
    var series_label: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var live_label: UILabel = {
        let label = UILabel()
        
        label.text = "LIVE"
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textAlignment = .left
        label.textColor = .mainRed
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var live_system_image: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(weight: .bold)
        let image = UIImage(systemName: "record.circle.fill", withConfiguration: configuration)
        let newImage = UIImageView(image: image)
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.tintColor = .mainRed
        
        return newImage
    }()
    
    var country_flag1: UILabel = {
        let image = UILabel()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.font = UIFont.systemFont(ofSize: 19)
        
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
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var current_map: UIImageView = {
        let image = UIImageView()
        
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var team1_round: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var team2_round: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 20)
        label.textColor = .white
        label.textAlignment = .center
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
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 12)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var team_name2: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 12)
        label.textColor = .white
        label.numberOfLines = 2
        label.clipsToBounds = true
        label.lineBreakMode = .byClipping
        label.baselineAdjustment = .alignCenters
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var bottomRectangle: UIImageView = {
        var image = UIImageView()
        
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
        case "flag_gb": newString = "🇬🇧"
        case "flag_ar": newString = "🇦🇷"
        case "flag_jp": newString = "🇯🇵"
        case "flag_kr": newString = "🇰🇷"
        case "flag_tr": newString = "🇹🇷"
        case "flag_pl": newString = "🇵🇱"
        case "flag_eg": newString = "🇪🇬"
        case "flag_il": newString = "🇮🇱"
        default:
            newString = "🇺🇳"
        }
        return newString
    }
    
    func set(seriesLabel: String, current_map: String, map_number: String, team1_round: String, team2_round: String, score1: String, score2: String, country_flag1: String, country_flag2: String, team_name1: String, team_name2: String){
        self.series_label.text = seriesLabel
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
        
        set(seriesLabel: "Regular Week: Round 1", current_map: "Fracture", map_number: "1", team1_round: "12", team2_round: "3", score1: "0", score2: "0", country_flag1: "flag_cn", country_flag2: "flag_cn", team_name1: "Fun Plus Phoenix Team", team_name2: "KRU Esports")
        addElements()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements(){
        setImage()
        setSeriesLabel()
        setLiveSystemImage()
        setLiveLabel()
        setBottomRectangle()
        setTeamName1()
        setCountryLabel1()
        setTeamRound1()
        setMapName()
        setScoreLabel()
        setTeamRound2()
        setTeamName2()
        setCountryLabel2()
    }
    
    func setImage(){
        addSubview(current_map)
        
        NSLayoutConstraint.activate([
            
            current_map.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            
            current_map.trailingAnchor.constraint(equalTo: current_map.leadingAnchor, constant: 354),
            
            current_map.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            
            current_map.bottomAnchor.constraint(equalTo: self.current_map.topAnchor, constant: 114)
            
        ])
    }
    
    func setSeriesLabel(){
        current_map.addSubview(series_label)
        
        NSLayoutConstraint.activate([
            
            series_label.leadingAnchor.constraint(equalTo: current_map.leadingAnchor, constant: 8),
            
            series_label.bottomAnchor.constraint(equalTo: current_map.bottomAnchor, constant: -6.73)
            
        ])
    }
    
    func setLiveSystemImage(){
        current_map.addSubview(live_system_image)
        
        NSLayoutConstraint.activate([
        
            live_system_image.leadingAnchor.constraint(equalTo: current_map.leadingAnchor, constant: 298),
            
            live_system_image.bottomAnchor.constraint(equalTo: current_map.bottomAnchor, constant: -9.3),
            
            live_system_image.widthAnchor.constraint(equalToConstant: 12.33),
            
            live_system_image.heightAnchor.constraint(equalToConstant: 12.33)
        
        ])
    }
    
    func setLiveLabel(){
        current_map.addSubview(live_label)
        
        NSLayoutConstraint.activate([
        
            live_label.leadingAnchor.constraint(equalTo: live_system_image.trailingAnchor, constant: 4.33),
            
            live_label.widthAnchor.constraint(equalToConstant: 33),
            
            live_label.heightAnchor.constraint(equalToConstant: 18),
            
            live_label.bottomAnchor.constraint(equalTo: current_map.bottomAnchor, constant: -6.73)
        
        ])
    }
    
    func setBottomRectangle(){
        addSubview(bottomRectangle)
        
        NSLayoutConstraint.activate([
        
            bottomRectangle.topAnchor.constraint(equalTo: current_map.bottomAnchor, constant: -1),
            
            bottomRectangle.leadingAnchor.constraint(equalTo: current_map.leadingAnchor),
            
            bottomRectangle.trailingAnchor.constraint(equalTo: current_map.trailingAnchor),
            
            bottomRectangle.bottomAnchor.constraint(equalTo: self.bottomRectangle.topAnchor, constant: 65)
            
        ])
    }
    
    func setTeamName1(){
        bottomRectangle.addSubview(team_name1)
        
        NSLayoutConstraint.activate([
        
            team_name1.leadingAnchor.constraint(equalTo: bottomRectangle.leadingAnchor, constant: 8),
            
            team_name1.widthAnchor.constraint(equalToConstant: 100),
            
            team_name1.heightAnchor.constraint(equalToConstant: 31),
            
            team_name1.topAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 3)
        
        ])
    }
    
    func setCountryLabel1(){
        bottomRectangle.addSubview(country_flag1)
        
        NSLayoutConstraint.activate([
        
            country_flag1.centerXAnchor.constraint(equalTo: team_name1.centerXAnchor),
            
            country_flag1.topAnchor.constraint(equalTo: team_name1.bottomAnchor, constant:-1)
        
        ])
    }
    
    func setTeamRound1(){
        bottomRectangle.addSubview(team1_round)
        
        NSLayoutConstraint.activate([
            
            team1_round.widthAnchor.constraint(equalToConstant: 23),
            
            team1_round.heightAnchor.constraint(equalToConstant: 25),
        
            team1_round.leadingAnchor.constraint(equalTo: team_name1.trailingAnchor, constant: 8),
            
            team1_round.topAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 26)
        
        ])
    }
    
    func setMapName(){
        bottomRectangle.addSubview(map_name)
        
        NSLayoutConstraint.activate([
        
            map_name.widthAnchor.constraint(equalToConstant: 98),
            
            map_name.heightAnchor.constraint(equalToConstant: 20),
            
            map_name.leadingAnchor.constraint(equalTo: team_name1.trailingAnchor, constant: 20),
            
            map_name.topAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 7)
        
        ])
    }
    
    func setScoreLabel(){
        bottomRectangle.addSubview(score_text)
        
        NSLayoutConstraint.activate([
        
            score_text.widthAnchor.constraint(equalToConstant: 27),
            
            score_text.heightAnchor.constraint(equalToConstant: 16),
            
            score_text.leadingAnchor.constraint(equalTo: team1_round.trailingAnchor, constant: 24),
            
            score_text.bottomAnchor.constraint(equalTo: bottomRectangle.bottomAnchor, constant: -14)
        
        ])
    }
    
    func setTeamRound2(){
        bottomRectangle.addSubview(team2_round)
        
        NSLayoutConstraint.activate([
        
            team2_round.widthAnchor.constraint(equalToConstant: 23),
            
            team2_round.heightAnchor.constraint(equalToConstant: 25),
            
            team2_round.leadingAnchor.constraint(equalTo: score_text.trailingAnchor, constant: 24),
            
            team2_round.topAnchor.constraint(equalTo: team1_round.topAnchor)
        
        ])
    }
    
    func setTeamName2(){
        bottomRectangle.addSubview(team_name2)
        
        NSLayoutConstraint.activate([
            
            team_name2.widthAnchor.constraint(equalToConstant: 100),
            
            team_name2.heightAnchor.constraint(equalToConstant: 31),
        
            team_name2.leadingAnchor.constraint(equalTo: map_name.trailingAnchor, constant: 20),
            
            team_name2.topAnchor.constraint(equalTo: team_name1.topAnchor)
        
        ])
    }
    
    func setCountryLabel2(){
        bottomRectangle.addSubview(country_flag2)
        
        NSLayoutConstraint.activate([
        
            country_flag2.centerXAnchor.constraint(equalTo: team_name2.centerXAnchor),
            
            country_flag2.centerYAnchor.constraint(equalTo: country_flag1.centerYAnchor)
        
        ])
    }
    
 }
#Preview(){
    LiveViewCell()
}

