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
    
    let refreshControl = UIRefreshControl()
    
    var allChampionshipsChosen: Bool = true
    
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
    
    var didApplyFilter: Bool = false
    var championshipName: String = ""
    
    var popupButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("All Championships", for: UIControl.State.normal)
        button.setTitleColor(.mainRed, for: UIControl.State.normal)
        button.frame = CGRect(x: 0, y: 0, width: 354, height: 18)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.titleLabel?.textAlignment = .left
        button.titleLabel?.numberOfLines = 0
        button.contentHorizontalAlignment = .left
        button.translatesAutoresizingMaskIntoConstraints = false
        button.showsMenuAsPrimaryAction = true
        return button
    }()
    
    var chevronImage: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(weight: .bold)
        let image = UIImage(systemName: "chevron.up.chevron.down", withConfiguration: configuration)
        let newImage = UIImageView(image: image)
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.tintColor = .mainRed
        
        return newImage
    }()

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
        
        refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        
        self.view.backgroundColor = .customBlack
        self.title = "Upcoming Matches"
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView.delegate = upcomingViewDelegate
        self.collectionView.dataSource = upcomingViewDataSource
        
        receiveUpcomingMatches()
        setElements()
        
        collectionView.addSubview(refreshControl)
    }
    
    func setElements(){
        setupCollectionView()
        setupButton()
        setupImage()
    }
    
    @objc func refresh(){
        self.collectionView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func receiveUpcomingMatches(){
        Task {
            await upcomingMatchModel.getMatches { error in
                if let error = error {
                    print(error)
                } else {
                    DispatchQueue.main.async {
                        if (!self.didApplyFilter){
                            self.matches = self.upcomingMatchModel.upcomingMatches
                            self.upcomingViewDataSource.matches = self.matches
                            self.popupButton.menu = self.createActions()
                            self.collectionView.reloadData()
                        } else {
                            var newMatchesArray: [UpcomingSegment] = []
                            self.upcomingMatchModel.upcomingMatches.forEach { match in
                                if (match.matchEvent == self.championshipName){
                                    newMatchesArray.append(match)
                                }
                            }
                            self.matches = newMatchesArray
                            print(self.matches.count)
                            self.upcomingViewDataSource.matches = self.matches
                            self.collectionView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    func createActions() -> UIMenu{
        var actions: [UIAction] = []
        var newArray: [String] = []
        
        let firstAction = UIAction(title: "All Championships",state: allChampionshipsChosen ? .on : .off ) { action in
            self.allChampionshipsChosen = true
            self.didApplyFilter = false
            print("Opção selecionada: All")
            self.popupButton.setTitle("All Championships", for: UIControl.State.normal)
            self.receiveUpcomingMatches()
        }
        actions.append(firstAction)
        
        matches.forEach { match in
            newArray.append(match.matchEvent)
        }
        
        //Tira elementos repetidos
        let uniqueElementsArray = Array(Set(newArray))
        
        uniqueElementsArray.forEach { unique in
            
            let action = UIAction(title: unique, handler: { action in
                self.allChampionshipsChosen = false
                self.popupButton.menu = self.createActions()
                self.didApplyFilter = true
                self.championshipName = unique
                print("Opção selecionada: \(unique)")
                self.popupButton.setTitle(unique, for: UIControl.State.normal)
                self.receiveUpcomingMatches()
            })
            
            actions.append(action)
        }
        
        return UIMenu(title: "Choose Championship", options: .displayInline, children: actions)
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
    
    func setupButton(){
        
        collectionView.addSubview(popupButton)
        
        NSLayoutConstraint.activate([
        
            popupButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            
            popupButton.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 59)
        
        ])
    }
    
    func setupImage(){
        
        collectionView.addSubview(chevronImage)
        
        NSLayoutConstraint.activate([
            
            chevronImage.widthAnchor.constraint(equalToConstant: 14),
            
            chevronImage.heightAnchor.constraint(equalToConstant: 18),
            
            chevronImage.leadingAnchor.constraint(equalTo: popupButton.trailingAnchor, constant: 3),
            
            chevronImage.bottomAnchor.constraint(equalTo: popupButton.bottomAnchor, constant: -7),
            
            chevronImage.trailingAnchor.constraint(lessThanOrEqualTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -28)
        
        ])
    }

}


#Preview(){
    MainTabBarController()
}
