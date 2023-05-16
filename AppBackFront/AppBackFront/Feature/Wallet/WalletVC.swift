//
//  WalletVC.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 15/05/23.
//

import UIKit

enum WalletNameCell: Int {
    case quotationEth = 1
}

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
        viewModel.delegate(delegate: self)
        viewModel.fetch(.request)
    }
}

extension WalletVC: WalletViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.screen?.configTableView(delegate: self, dataSource: self)
            self.screen?.tableView.reloadData()
        }
    }
    
    func error() {
        print(#function)
    }
}

extension WalletVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuotationEthTableViewCell.identifier, for: indexPath) as? QuotationEthTableViewCell
        cell?.setUpCell(data: viewModel.loadCurrentQuotationEthereum())
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRow(indexPath: indexPath)
    }
}
