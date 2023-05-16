//
//  NftDetailVCViewController.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 11/05/23.
//

import UIKit

enum NameCellNftDetailVC: Int {
    case nftImage = 0
    case description = 1
    case latestDeals = 2
}

class NftDetailVC: UIViewController {
    
    private var screen: NftDetailScreen?
    private let viewModel: NftDetailViewModel
    
    override func loadView() {
        screen = NftDetailScreen()
        view = screen
    }
    
    required init(nft: Nft) {
        viewModel = NftDetailViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }

}

extension NftDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch NameCellNftDetailVC(rawValue: indexPath.row) {
            
        case .nftImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as? NftImageTableViewCell
            cell?.setUpCell(urlImage: viewModel.nftImage, delegate: self)
            return cell ?? UITableViewCell()
            
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell
            cell?.setUpCell(id: viewModel.idNft, title: viewModel.titleNft, description: viewModel.descriptionNft)
            return cell ?? UITableViewCell()
            
        case .latestDeals:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestDealTableViewCell.identifier, for: indexPath) as? LatestDealTableViewCell
            cell?.setUpCell(data: viewModel.getNft)
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        viewModel.heightForRow(indexPath: indexPath, width: view.frame.width)
    }
}

extension NftDetailVC: NftImageTableViewCellScreenDelegate {
    func tappedCloseButton() {
        self.dismiss(animated: true)
    }
    
    func tappedMagnifyingGlassButton() {
        let vc: MagnifyingGlassVC = MagnifyingGlassVC(urlImage: viewModel.nftImage)
        present(vc, animated: true)
    }
}
