//
//  UpcomingViewCell.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import UIKit

class UpcomingViewCell: UICollectionViewCell {
    
    static let identifier = "UpcomingViewCell"
    
    var isSelectedBool: Bool = false
    
    var seriesLabel: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var date: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
    
    var game_time: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 14)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var time_from_now: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 12)
        label.textColor = .customTextGray
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
    
    var bellButton: UIImageView = {
        let imageView = UIImageView()
        
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
//    var bellButton: UIButton = {
//        let button = UIButton()
//        
//        button.setImage(UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: UIControl.State.normal)
//        button.tintColor = .white
//        button.setTitleColor(UIColor.yellow, for: UIControl.State.selected)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        
//        return button
//    }()
    
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
        case "flag_eg": newString = "🇪🇬"
        case "flag_il": newString = "🇮🇱"
        default:
            newString = "🇺🇳"
        }
        return newString
    }
    
    func set(seriesLabel: String, date: String, country_flag1: String, country_flag2: String, team_name1: String, team_name2: String, game_time: String, time_from_now: String){
        self.seriesLabel.text = seriesLabel
        self.date.text = date
        self.country_flag1.text = addEmoji(string: country_flag1)
        self.country_flag2.text = addEmoji(string: country_flag2)
        self.team_name1.text = team_name1
        self.team_name2.text = team_name2
        self.game_time.text = game_time
        self.time_from_now.text = time_from_now
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        set(seriesLabel: "teste", date: "teste", country_flag1: "flag_cn", country_flag2: "flag_cn", team_name1: "fun plus phoenix", team_name2: "Leviathan", game_time: "12:00", time_from_now: "(10d 21h from now)")
        addElements()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func reloadImage(){
        if(isSelectedBool){
            bellButton.image = UIImage(systemName: "bell.fill")
        }
        else{
            bellButton.image = UIImage(systemName: "bell")
        }
        
    }
    
    func addElements(){
        addTopRectangle()
        addBottomRectangle()
        addSeriesLabel()
        addBellImage()
        addDateLabel()
        addCountryFlag1()
        addTeamName1()
        addGameTime()
        addTimeFromNow()
        addTeamName2()
        addCountryFlag2()
    }
    
    func addTopRectangle(){
        addSubview(topRectangle)
        
        NSLayoutConstraint.activate([
        
            topRectangle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            
            topRectangle.trailingAnchor.constraint(equalTo: topRectangle.leadingAnchor, constant: 354),
            
            topRectangle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            
            topRectangle.bottomAnchor.constraint(equalTo: self.topRectangle.topAnchor, constant: 38)
            
            
        ])
    }
    
    func addBottomRectangle(){
        addSubview(bottomRectangle)
        
        NSLayoutConstraint.activate([
        
            bottomRectangle.leadingAnchor.constraint(equalTo: topRectangle.leadingAnchor),
            
            bottomRectangle.trailingAnchor.constraint(equalTo: topRectangle.trailingAnchor),
            
            bottomRectangle.topAnchor.constraint(equalTo: topRectangle.bottomAnchor),
            
            bottomRectangle.bottomAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 71)
            
            
        ])
    }
    
    func addSeriesLabel(){
        topRectangle.addSubview(seriesLabel)
        
        NSLayoutConstraint.activate([
        
            seriesLabel.leadingAnchor.constraint(equalTo: topRectangle.leadingAnchor, constant: 8),
            
            seriesLabel.topAnchor.constraint(equalTo: topRectangle.topAnchor, constant: 13),
            
            seriesLabel.bottomAnchor.constraint(equalTo: topRectangle.bottomAnchor, constant: -7)
            
        ])
    }
    
    func addBellImage(){
        bellButton.image = UIImage(systemName: "bell")
//        bellButton.image = UIImage(systemName: isSelectedBool ? "bell.fill" : "bell")
        
        topRectangle.addSubview(bellButton)
        
        NSLayoutConstraint.activate([
            
            bellButton.widthAnchor.constraint(equalToConstant: 17),
            
            bellButton.heightAnchor.constraint(equalToConstant: 18.7),
        
            bellButton.topAnchor.constraint(equalTo: seriesLabel.topAnchor, constant: -2),
            
            bellButton.trailingAnchor.constraint(equalTo: topRectangle.trailingAnchor, constant: -8)
        
        ])
    }
    
    func addDateLabel(){
        topRectangle.addSubview(date)
        
        NSLayoutConstraint.activate([
            
            date.trailingAnchor.constraint(equalTo: bellButton.leadingAnchor, constant: -10),
            
            date.topAnchor.constraint(equalTo: seriesLabel.topAnchor),
            
            date.bottomAnchor.constraint(equalTo: seriesLabel.bottomAnchor)
            
        ])
    }
    
    func addCountryFlag1(){
        bottomRectangle.addSubview(country_flag1)
        
        NSLayoutConstraint.activate([
        
            country_flag1.topAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 27),
            
            country_flag1.leadingAnchor.constraint(equalTo: bottomRectangle.leadingAnchor, constant: 10),
            
            country_flag1.bottomAnchor.constraint(equalTo: bottomRectangle.bottomAnchor, constant: -30)
        
        ])
    }
    
    func addTeamName1(){
        bottomRectangle.addSubview(team_name1)
        
        NSLayoutConstraint.activate([
        
            team_name1.topAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 16),
            
            team_name1.leadingAnchor.constraint(equalTo: country_flag1.trailingAnchor, constant: 8),
            
            team_name1.bottomAnchor.constraint(equalTo: bottomRectangle.bottomAnchor, constant: -18),
            
            team_name1.trailingAnchor.constraint(equalTo: team_name1.leadingAnchor, constant: 62),
        
        ])
    }
    
    func addGameTime(){
        bottomRectangle.addSubview(game_time)
        
        NSLayoutConstraint.activate([
        
            game_time.topAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 20),
            
            game_time.leadingAnchor.constraint(equalTo: team_name1.trailingAnchor, constant: 52)
        
        ])
    }
    
    func addTimeFromNow(){
        bottomRectangle.addSubview(time_from_now)
        
        NSLayoutConstraint.activate([
        
            time_from_now.leadingAnchor.constraint(equalTo: team_name1.trailingAnchor, constant: 15),
            
            time_from_now.topAnchor.constraint(equalTo: game_time.bottomAnchor, constant: 1),
            
            time_from_now.widthAnchor.constraint(equalToConstant: 110)
        
        ])
    }
    
    func addTeamName2(){
        bottomRectangle.addSubview(team_name2)
        
        NSLayoutConstraint.activate([
            
            team_name2.topAnchor.constraint(equalTo: team_name1.topAnchor),
            
            team_name2.bottomAnchor.constraint(equalTo: team_name1.bottomAnchor),
        
            team_name2.leadingAnchor.constraint(equalTo: game_time.trailingAnchor, constant: 52),
            
            team_name2.trailingAnchor.constraint(equalTo: team_name2.leadingAnchor, constant: 62)
        
        ])
    }
    
    func addCountryFlag2(){
        bottomRectangle.addSubview(country_flag2)
        
        NSLayoutConstraint.activate([
            
            country_flag2.topAnchor.constraint(equalTo: country_flag1.topAnchor),
            
            country_flag2.bottomAnchor.constraint(equalTo: country_flag1.bottomAnchor),
            
//            country_flag2.leadingAnchor.constraint(equalTo: team_name2.trailingAnchor, constant: 15),
            
            country_flag2.trailingAnchor.constraint(equalTo: bottomRectangle.trailingAnchor, constant: -10)
            
        ])
    }
    
    
    
    
}

#Preview(){
    UpcomingViewCell()
}
