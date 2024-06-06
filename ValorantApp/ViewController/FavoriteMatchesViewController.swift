//
//  FavoriteMatchesViewController.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 28/05/24.
//

import UIKit

class FavoriteMatchesViewController: UIViewController {
    
    var favoriteViewDataSource: FavoriteViewDataSource
    var favoriteViewDelegate: FavoriteViewDelegate
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .customBlack
        collectionView.register(UpcomingViewCell.self, forCellWithReuseIdentifier: UpcomingViewCell.identifier)
        return collectionView
    }()
    
    var matches: [FavoriteModel] = []
    
    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.matches = DataController.shared.getAllMatches()
        self.favoriteViewDataSource = FavoriteViewDataSource(matches: matches)
        self.favoriteViewDelegate = FavoriteViewDelegate(matches: matches)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.matches = DataController.shared.getAllMatches()
        self.favoriteViewDataSource.matches = self.matches
        collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.reloadData()
        
        self.view.backgroundColor = .customBlack
        self.title = "Notified Matches"
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView.delegate = favoriteViewDelegate
        self.collectionView.dataSource = favoriteViewDataSource
        
        setElements()

        // Do any additional setup after loading the view.
    }
    
    
    func setElements(){
        setupCollectionView()
    }
    
    func setupCollectionView(){
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        ])
        
    }


}
