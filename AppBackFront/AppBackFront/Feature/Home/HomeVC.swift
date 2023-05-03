//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 03/05/23.
//

import UIKit

class HomeVC: UIViewController {
    
    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
