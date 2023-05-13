//
//  NftDetailViewModel.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 11/05/23.
//

import UIKit

class NftDetailViewModel {
    let nft: Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 2
    }
    
    public var nftImage: String {
        return nft.nftImage ?? ""
    }
    
    public var idNft: Int {
        return nft.nftID ?? 0
    }
    
    public var titleNft: String {
        return nft.nftNameImage ?? ""
    }
    
    public var descriptionNft: String {
        return nft.nftDescription ?? ""
    }
    
    public func heightForRow(indexPath: IndexPath, width: CGFloat) -> CGFloat{
        switch NameCellNftDetailVC(rawValue: indexPath.row) {
        case .nftImage:
            return 400
        case .description:
            var totalLabel = descriptionNft.height(withConstrainedWidth: width - 40, font: .systemFont(ofSize: 18))
            return 5 + totalLabel + 5 + 30 + 5 + 24 + 10 + 10
        default:
            return 0
        }
    }
}
