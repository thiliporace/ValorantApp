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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .customBlack
        collectionView.register(UpcomingViewCell.self, forCellWithReuseIdentifier: UpcomingViewCell.identifier)
        return collectionView
    }()
    
    var upcomingMatchModel = UpcomingMatchModel()
    var matches = [UpcomingSegment]()
    {
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }

    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.upcomingViewDataSource = UpcomingViewDataSource(matches: matches)
        self.upcomingViewDelegate = UpcomingViewDelegate()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        receiveUpcomingMatches()
        
        self.view.backgroundColor = .customBlack
        self.title = "Upcoming Matches"
        
        navigationController?.navigationBar.barTintColor = .customBlack
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView.delegate = upcomingViewDelegate
        self.collectionView.dataSource = upcomingViewDataSource
        setElements()
        
    }
    
    func setElements(){
        setupCollectionView()
    }
    
    func receiveUpcomingMatches(){
        upcomingMatchModel.getMatches { matches in
            self.matches = matches
//            self.collectionView.reloadData()
        }
    }
    
    func setupCollectionView(){
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 82),
            
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
        
    }

}


#Preview(){
    MainTabBarController()
}
