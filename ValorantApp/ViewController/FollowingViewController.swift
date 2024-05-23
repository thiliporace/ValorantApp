//
//  FollowingViewController.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import UIKit

class FollowingViewController: UIViewController {
    
    let regions: [String] = ["na","eu","ap","la","la-s","la-n","oce","kr","mn","gc","br","cn"]
    
    var followingViewDataSource: FollowingViewDataSource
    var followingViewDelegate: FollowingViewDelegate
    
    let receiveMatches: Bool = false
    
    var allRegionsChosen: Bool = true
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .customBlack
        collectionView.isUserInteractionEnabled = true
        collectionView.register(BigFollowingViewCell.self, forCellWithReuseIdentifier: BigFollowingViewCell.identifier)
        return collectionView
    }()
    
    var followingMatchModel = FollowingModel()
    var matches = [FollowingSegment]()
    
    var didApplyFilter: Bool = false
    var regionName: String = ""
    
    var popupButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("All Regions", for: UIControl.State.normal)
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
        self.followingViewDataSource = FollowingViewDataSource(matches: matches)
        self.followingViewDelegate = FollowingViewDelegate()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .customBlack
        self.title = "All Teams"
        self.collectionView.isUserInteractionEnabled = true
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.layoutIfNeeded()
        
        navigationController?.navigationBar.barTintColor = .clear
        navigationController?.navigationBar.backgroundColor = .clear
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.collectionView.delegate = followingViewDelegate
        self.collectionView.dataSource = followingViewDataSource
        
        receiveUpcomingMatches()
        setElements()
    }
    
    func setElements(){
        setupCollectionView()
        setupButton()
        setupImage()
       
    }
    
    func receiveUpcomingMatches(){
        var hasError: Bool = true
        
        for (index, region) in regions.enumerated() {
            Task{
                await followingMatchModel.getTeams(region: region) { error in
                    if let error = error {
                        print(error)
                    } else {
                        //Esse if roda so no ultimo item do for, então a tela não fica se atualizando toda hora
//                        if (index == regions.count - 1) {
                            DispatchQueue.main.async {
                                if (!self.didApplyFilter){
                                    self.matches = self.followingMatchModel.followingTeams
                                    self.followingViewDataSource.matches = self.matches
                                    self.popupButton.menu = self.createActions()
                                    self.collectionView.reloadData()
                                }
                                else{
                                    if (region == self.regionName){
                                        self.matches.removeAll()
                                        self.matches = self.followingMatchModel.followingTeams
                                        self.followingViewDataSource.matches = self.matches
                                        self.collectionView.reloadData()
                                        print(self.matches.count)
                                    }
                                    
                                    
                                }
                            }
//                        }
                        
                    }
                }
            }
        }
       
            if(!hasError) {
                
            }
        
    }
    
    func changeRegionName(region: String) -> String{
        
        var newName: String = ""
        
        switch region{
        case "na":
            newName = "North America"
        case "eu":
            newName = "Europe"
        case "ap":
            newName = "Asia Pacific"
        case "la":
            newName = "Latin America"
        case "la-s":
            newName = "South Latin America"
        case "la-n":
            newName = "North Latin America"
        case "oce":
            newName = "Oceania"
        case "kr":
            newName = "Korea"
        case "mn":
            newName = "Mena"
        case "gc":
            newName = "Game Changers"
        case "br":
            newName = "Brazil"
        case "cn":
            newName = "China"
        default:
            newName = "North America"
            
        }
        
        return newName
    }
    
    func createActions() -> UIMenu{
        var actions: [UIAction] = []
        var newArray: [String] = []
        
        let firstAction = UIAction(title: "All Regions",state: allRegionsChosen ? .on : .off ) { action in
            self.allRegionsChosen = true
            self.didApplyFilter = false
            print("Opção selecionada: All")
            self.popupButton.setTitle("All Regions", for: UIControl.State.normal)
            self.receiveUpcomingMatches()
        }
        actions.append(firstAction)
        
        regions.forEach { region in
            newArray.append(region)
        }
        
        //Tira elementos repetidos
        let uniqueElementsArray = Array(Set(newArray))
        
        uniqueElementsArray.forEach { unique in
            
            let action = UIAction(title: self.changeRegionName(region: unique), handler: { action in
                self.allRegionsChosen = false
                self.popupButton.menu = self.createActions()
                self.didApplyFilter = true
                self.regionName = unique
                print("Opção selecionada: \(unique)")
                self.popupButton.setTitle(self.changeRegionName(region: unique), for: UIControl.State.normal)
                self.receiveUpcomingMatches()
            })
            
            actions.append(action)
        }
        
        return UIMenu(title: "Choose Region", options: .displayInline, children: actions)
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
