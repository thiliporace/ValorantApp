//
//  UpcomingViewController.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    
    var upcomingViewDataSource: UpcomingViewDataSource
    var upcomingViewDelegate: UpcomingViewDelegate
    
    lazy var upcomingMatchModel: UpcomingMatchModel = {
        return UpcomingMatchModel(viewController: self)
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .customBlack
        collectionView.register(UpcomingViewCell.self, forCellWithReuseIdentifier: UpcomingViewCell.identifier)
        return collectionView
    }()
    
    let array: [String] = ["1","2","1","2","1","2","1","2","1","2"]

    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.upcomingViewDataSource = UpcomingViewDataSource(array: array)
        self.upcomingViewDelegate = UpcomingViewDelegate()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .customBlack
        self.title = "Upcoming Matches"
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView.delegate = upcomingViewDelegate
        self.collectionView.dataSource = upcomingViewDataSource
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
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
        
    }
    
    func fillText(){
        print("alo")
        for match in upcomingMatchModel.upcomingMatches {
            print(match.team1)
        }
        
        
    }

}


#Preview(){
    MainTabBarController()
}
