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
    
    let receiveMatches: Bool = false
    
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
    
    var championshipPicker: UIPickerView = {
        let picker = UIPickerView()
        
        picker.tintColor = .mainRed
        picker.backgroundColor = .mainRed
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        return picker
    }()

    var pickerUpcomingDataSource: PickerUpcomingDataSource
    var pickerUpcomingDelegate: PickerUpcomingDelegate

    internal override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        self.upcomingViewDataSource = UpcomingViewDataSource(matches: matches)
        self.upcomingViewDelegate = UpcomingViewDelegate()
        
        self.pickerUpcomingDataSource = PickerUpcomingDataSource(matches: matches)
        self.pickerUpcomingDelegate = PickerUpcomingDelegate(matches: matches)
        
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
        
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView.delegate = upcomingViewDelegate
        self.collectionView.dataSource = upcomingViewDataSource
        
        setElements()
        
    }
    
    func setElements(){
        setupCollectionView()
        setupPicker()
    }
    
    func receiveUpcomingMatches(){
        
        upcomingMatchModel.getMatches()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.8)
        {
            self.matches = self.upcomingMatchModel.upcomingMatches
            self.upcomingViewDataSource.matches = self.matches
            self.collectionView.reloadData()
//            print(self.matches)
        }
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
    
    func setupPicker(){
        view.addSubview(championshipPicker)
        
        NSLayoutConstraint.activate([
        
            championshipPicker.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            
            championshipPicker.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 29)
        
        ])
    }

}


#Preview(){
    MainTabBarController()
}
