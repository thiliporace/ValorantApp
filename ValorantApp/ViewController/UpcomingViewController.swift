//
//  UpcomingViewController.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import UIKit

class UpcomingViewController: UIViewController, UITableViewDelegate {
    
    lazy var upcomingMatchModel: UpcomingMatchModel = {
        return UpcomingMatchModel(viewController: self)
    }()
    
    let tableView = UITableView()
    
    let array: [String] = ["1","2","1","2","1","2","1","2","1","2"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .customBlack
        self.title = "Upcoming Matches"
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        setElements()
        
    }
    
    func setElements(){
        receiveUpcomingMatches()
        fillText()
        setupTableView()
    }
    
    func receiveUpcomingMatches(){
        
        upcomingMatchModel.getMatches()
    }
    
    func setupTableView(){
        view.addSubview(tableView)
        
        tableView.backgroundColor = .customBlack
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
        tableView.register(UpcomingViewCell.self, forCellReuseIdentifier: "UpcomingViewCell")
    }
    
    func fillText(){
        print("alo")
        for match in upcomingMatchModel.upcomingMatches {
            print(match.team1)
        }
        
        
    }


}

extension UpcomingViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return array.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingViewCell", for: indexPath) as? UpcomingViewCell else {
          fatalError("The TableView could not dequeue a CustomCell in ViewController.")
      }
    
      cell.set(seriesLabel: "teste", date: "teste", country_flag1: "teste", country_flag2: "teste", team_name1: "teste", team_name2: "teste", game_time: "teste", time_from_now: "teste")
      cell.layer.cornerRadius = 8
      cell.clipsToBounds = true
    return cell
  }
}

#Preview(){
    MainTabBarController()
}
