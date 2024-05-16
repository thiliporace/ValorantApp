//
//  UpcomingViewCell.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import UIKit

class UpcomingViewCell: UICollectionViewCell {
    
    static let identifier = "UpcomingViewCell"
    
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
    
    var country_flag1: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: 0, y: 0, width: 20, height: 13.33)
        
        return image
    }()
    
    var country_flag2: UIImageView = {
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.frame = CGRect(x: 0, y: 0, width: 20, height: 13.33)
        
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
    
    func set(seriesLabel: String, date: String, country_flag1: String, country_flag2: String, team_name1: String, team_name2: String, game_time: String, time_from_now: String){
        self.seriesLabel.text = seriesLabel
        self.date.text = date
        self.country_flag1.image = UIImage(named: "\(country_flag1)")
        self.country_flag2.image = UIImage(named: "\(country_flag2)")
        self.team_name1.text = team_name1
        self.team_name2.text = team_name2
        self.game_time.text = game_time
        self.time_from_now.text = time_from_now
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        set(seriesLabel: "teste", date: "teste", country_flag1: "flag_cn", country_flag2: "flag_cn", team_name1: "fun plus phoenix", team_name2: "Leviathan", game_time: "12:00", time_from_now: "(1d 2h from now)")
        addElements()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements(){
        addTopRectangle()
        addBottomRectangle()
        addSeriesLabel()
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
    
    func addDateLabel(){
        topRectangle.addSubview(date)
        
        NSLayoutConstraint.activate([
            
            date.trailingAnchor.constraint(equalTo: topRectangle.trailingAnchor, constant: -8),
            
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
            
            team_name1.leadingAnchor.constraint(equalTo: country_flag1.trailingAnchor, constant: 13),
            
            team_name1.bottomAnchor.constraint(equalTo: bottomRectangle.bottomAnchor, constant: -18),
            
            team_name1.trailingAnchor.constraint(equalTo: team_name1.leadingAnchor, constant: 62),
        
        ])
    }
    
    func addGameTime(){
        bottomRectangle.addSubview(game_time)
        
        NSLayoutConstraint.activate([
        
            game_time.topAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 16),
            
            game_time.leadingAnchor.constraint(equalTo: team_name1.trailingAnchor, constant: 52)
        
        ])
    }
    
    func addTimeFromNow(){
        bottomRectangle.addSubview(time_from_now)
        
        NSLayoutConstraint.activate([
        
            time_from_now.leadingAnchor.constraint(equalTo: team_name1.trailingAnchor, constant: 24),
            
            time_from_now.topAnchor.constraint(equalTo: game_time.bottomAnchor, constant: 0)
        
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
            
            country_flag2.leadingAnchor.constraint(equalTo: team_name2.trailingAnchor, constant: 13),
            
            country_flag2.trailingAnchor.constraint(equalTo: bottomRectangle.trailingAnchor, constant: -10)
            
            
        
        ])
    }
    
    
    
    
}

#Preview(){
    UpcomingViewCell()
}
