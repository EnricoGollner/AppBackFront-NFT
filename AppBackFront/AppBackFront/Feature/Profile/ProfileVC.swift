//
//  ProfileVC.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 16/05/23.
//

import UIKit

enum ProfileNameCell: Int {
    case profileImage = 0
    case profileDetails = 1
}

class ProfileVC: UIViewController {
    
    private var screen: ProfileScreen?
    
    override func loadView() {
        screen = ProfileScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch ProfileNameCell(rawValue: indexPath.row) {
        case .profileImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileImageTableViewCell.identifier, for: indexPath) as? ProfileImageTableViewCell
            return cell ?? UITableViewCell()
        case .profileDetails:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell
            cell?.setUpCell(delegate: self)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}

extension ProfileVC: ProfileTableViewCellScreenDelegate {
    func tappedExitAppButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
