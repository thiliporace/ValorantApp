//
//  FollowingViewCell.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 20/05/24.
//

import Foundation
import UIKit

class BigFollowingViewCell: UICollectionViewCell {
    
    static let identifier = "BigFollowingViewCell"
    
    var onButtonPressAction: (() -> ())?
    
    var team_label: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 20)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var rank_label: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var logo_image: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(weight: .bold)
        let image = UIImage(systemName: "record.circle.fill", withConfiguration: configuration)
        let newImage = UIImageView(image: image)
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.tintColor = .white
        
        return newImage
    }()
    
    var last_played_label: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var topRectangle: UIImageView = {
        var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 354, height: 70))
        
        image.backgroundColor = .customDarkGray
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var bottomRectangle: UIImageView = {
        var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 354, height: 70))
        
        image.backgroundColor = .customDarkGray
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    var followButton: CapsuleButton = {
        let button = CapsuleButton()
        
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.mainRed, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = .customFollowButton
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        button.isUserInteractionEnabled = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    func set(team_label: String, rank: String, region: String, last_played: String){
        self.logo_image.image = UIImage(named: team_label)
        self.team_label.text = team_label
        self.rank_label.text = String("Rank: #\(rank) \(region)")
        self.last_played_label.text = String("Last Played: \(last_played)")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        followButton.addTarget(self, action: #selector(self.onButtonPress), for: .touchUpInside)
                
        set(team_label: "100 Thieves", rank: "2", region: "China", last_played: "4 days ago")
        addElements()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func onButtonPress(sender: UIButton){
        print("Clicou")
        if !followButton.isSelected{
            print("Não tava selecionado")
            followButton.setTitle("Unfollow", for: .normal)
            followButton.isSelected = true
        }
        else{
            print("Tava selecionado")
            followButton.setTitle("Follow", for: .selected)
            followButton.isSelected = false
        }
        onButtonPressAction?()
    }
    
    func addElements(){
        setTopRectangle()
        setTeamLogo()
        setTeamName()
        setupFollowButton()
        setBottomRectangle()
        setRankLabel()
        setLastPlayedLabel()
    }
    
    func setTopRectangle(){
        addSubview(topRectangle)
        
        NSLayoutConstraint.activate([
        
            topRectangle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 18),
            
            topRectangle.trailingAnchor.constraint(equalTo: topRectangle.leadingAnchor, constant: 354),
            
            topRectangle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            
            topRectangle.bottomAnchor.constraint(equalTo: self.topRectangle.topAnchor, constant: 70)
        
        ])
    }
    
    func setTeamLogo(){
        topRectangle.addSubview(logo_image)
        
        NSLayoutConstraint.activate([
        
            logo_image.leadingAnchor.constraint(equalTo: topRectangle.leadingAnchor, constant: 19),
            
            logo_image.topAnchor.constraint(equalTo: topRectangle.topAnchor, constant: 20)
        
        ])
    }
    
    func setTeamName(){
        topRectangle.addSubview(team_label)
        
        NSLayoutConstraint.activate([
            
            team_label.heightAnchor.constraint(equalToConstant: 18),
        
            team_label.topAnchor.constraint(equalTo: topRectangle.topAnchor, constant: 27),
            
            team_label.leadingAnchor.constraint(equalTo: logo_image.trailingAnchor, constant: 19)
        
        ])
    }
    
    func setBottomRectangle(){
        addSubview(bottomRectangle)
        
        NSLayoutConstraint.activate([
        
            bottomRectangle.topAnchor.constraint(equalTo: topRectangle.bottomAnchor, constant: 1),
            
            bottomRectangle.bottomAnchor.constraint(equalTo: self.bottomRectangle.topAnchor, constant: 70),
            
            bottomRectangle.leadingAnchor.constraint(equalTo: topRectangle.leadingAnchor),
            
            bottomRectangle.trailingAnchor.constraint(equalTo: topRectangle.trailingAnchor)
        
        ])
    }
    
    func setRankLabel(){
        bottomRectangle.addSubview(rank_label)
        
        NSLayoutConstraint.activate([
        
            rank_label.leadingAnchor.constraint(equalTo: bottomRectangle.leadingAnchor, constant: 10),
            
            rank_label.topAnchor.constraint(equalTo: bottomRectangle.topAnchor, constant: 12)
        
        ])
    }
    
    func setLastPlayedLabel(){
        bottomRectangle.addSubview(last_played_label)
        
        NSLayoutConstraint.activate([
        
            last_played_label.leadingAnchor.constraint(equalTo: rank_label.leadingAnchor),
            
            last_played_label.bottomAnchor.constraint(equalTo: bottomRectangle.bottomAnchor, constant: -17)
        
        ])
    }
    
    func setupFollowButton(){
        topRectangle.addSubview(followButton)
        
        NSLayoutConstraint.activate([
        
            followButton.trailingAnchor.constraint(equalTo: topRectangle.trailingAnchor, constant: -14),
            
            followButton.topAnchor.constraint(equalTo: topRectangle.topAnchor, constant: 18)
        
        ])
    }
    
    
    
 }
#Preview(){
    BigFollowingViewCell()
}
