//
//  MainTabBarController.swift
//  ValorantApp
//
//  Created by Thiago Liporace on 14/05/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Cor do nome dos itens
        self.tabBar.tintColor = .mainRed
        
        //Cor da imagem do item
        self.tabBar.barTintColor = .customBlack
        
        self.tabBar.isTranslucent = false
        
        //Cor do fundo
        self.tabBar.backgroundColor = .customBlack
        
        configTabbars()
        
        
    }
    
    func configTabbars(){
        let upcomingViewController = UINavigationController(rootViewController: UpcomingViewController())
        
        //Colocando as configuracoes do item da tabbar
        upcomingViewController.tabBarItem.title = "Upcoming"
        upcomingViewController.tabBarItem.image = UIImage(systemName: "newspaper")
        upcomingViewController.tabBarItem.selectedImage = UIImage(systemName: "newspaper.fill")
        
        let liveViewController = UINavigationController(rootViewController: LiveViewController())
        
        liveViewController.tabBarItem.title = "Live"
        liveViewController.tabBarItem.image = UIImage(systemName: "record.circle")
        liveViewController.tabBarItem.selectedImage = UIImage(systemName: "record.circle.fill")
        
        let followingViewController = UINavigationController(rootViewController: FollowingViewController())
        
        followingViewController.tabBarItem.title = "Following"
        followingViewController.tabBarItem.image = UIImage(systemName: "star")
        followingViewController.tabBarItem.selectedImage = UIImage(systemName: "star.fill")
        
        self.setViewControllers([upcomingViewController, liveViewController, followingViewController], animated: true)
        
    }

}

#Preview() {
    MainTabBarController()
}
