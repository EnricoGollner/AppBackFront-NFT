//
//  ViewController.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 03/05/23.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBar()
    }
    
    private func setUpTabBar() {
        let home = UINavigationController(rootViewController: HomeVC())
        setViewControllers([home], animated: true)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor(red: 130/255, green: 26/255, blue: 201/255, alpha: 1.0)
        tabBar.backgroundColor = UIColor(red: 25/255, green: 26/255, blue: 1/255, alpha: 1.0)
        
        guard let items = tabBar.items else { return }
        items[0].image = UIImage(systemName: "house")
    }
}
