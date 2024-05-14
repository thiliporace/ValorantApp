//
//  UpcomingViewCell.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import UIKit

class UpcomingViewCell: UITableViewCell {
    
    var seriesLabel: UILabel = {
        let label = UILabel()
        
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
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var country_flag2: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var team_name1: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var team_name2: UILabel = {
        let label = UILabel()
        
        label.font = UIFont(name: "FrancaDEMO-Bold", size: 13)
        label.textColor = .white
        
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
    
    var infoStackView: UIStackView = {
        var stack = UIStackView()
        
        stack.spacing = 18
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    var stackView: UIStackView = {
        var stack = UIStackView()
        
        stack.spacing = 18
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    func set(seriesLabel: String, date: String, country_flag1: String, country_flag2: String, team_name1: String, team_name2: String, game_time: String, time_from_now: String){
        self.seriesLabel.text = seriesLabel
        self.date.text = date
        self.country_flag1.text = country_flag1
        self.country_flag2.text = country_flag2
        self.team_name1.text = team_name1
        self.team_name2.text = team_name2
        self.game_time.text = game_time
        self.time_from_now.text = time_from_now
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .customBlack
        
        hierarchy()
        setupUI()
    }
    
    func setupUI(){
        setConstraints()
        
    }
    
    func hierarchy(){
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(infoStackView)
        
        infoStackView.addArrangedSubview(seriesLabel)
        
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 18),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: 18)
        
        ])
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()
            
            self.contentView.layer.cornerRadius = 8
            self.contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 40, left: 18, bottom: 40, right: 18))
            
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview(){
    UpcomingViewCell()
}
