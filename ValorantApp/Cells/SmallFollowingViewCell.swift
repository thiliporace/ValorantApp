//
//  FollowingViewCell.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 20/05/24.
//

import Foundation
import UIKit

class SmallFollowingViewCell: UICollectionViewCell {
    
    static let identifier = "SmallFollowingViewCell"
    
    var team_label: UILabel = {
        let label = UILabel()
        
        label.text = ""
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var logo_image: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(weight: .bold)
        let image = UIImage(systemName: "record.circle.fill", withConfiguration: configuration)
        let newImage = UIImageView(image: image)
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.tintColor = .mainRed
        
        return newImage
    }()
    
    var rectangle: UIImageView = {
        var image = UIImageView(frame: CGRect(x: 0, y: 0, width: 354, height: 70))
        
        image.backgroundColor = .customDarkGray
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.translatesAutoresizingMaskIntoConstraints = false
        
        return image
    }()
    
    func set(team_label: String, rank: String, region: String, last_played: String){
        self.logo_image.image = UIImage(named: team_label)
        self.team_label.text = team_label
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        set(team_label: "Fun Plus Phoenix", rank: "2", region: "China", last_played: "4 days ago")
        addElements()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements(){
        
    }
    
    
    
 }
#Preview(){
    LiveViewCell()
}

