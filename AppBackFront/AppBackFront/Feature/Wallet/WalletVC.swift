//
//  WalletVC.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 15/05/23.
//

import UIKit

class WalletVC: UIViewController {
    
    private var screen: WalletScreen?
    private var viewModel: WalletViewModel = WalletViewModel()
    
    override func loadView() {
        screen = WalletScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetch(.request)
    }
}
