//
//  LatestDealTableViewCellViewModel.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 13/05/23.
//

enum HeightLatestDeal: CGFloat {
    case height = 70
}

import UIKit

class LatestDealTableViewCellViewModel {
    
    var nft: Nft?
    
    public func setNft(nft: Nft) {
        self.nft = nft
    }
    
    public var title: String {
        return nft?.titleLatestDeals ?? ""
    }
    
    public var numberOfRowsInSection: Int {
        return nft?.latestDeals?.count ?? 0
    }
    
    public var heightForRow: CGFloat {
        return HeightLatestDeal.height.rawValue
    }

    public func loadCurrentLatestDeal(indexPath: IndexPath) -> LatestDeal {
        return nft?.latestDeals?[indexPath.row] ?? LatestDeal()
    }
    
    public func isInitial(indexPath: IndexPath) -> Bool {
        return indexPath.row == 0
    }
    
    public func isFinal(indexPath: IndexPath) -> Bool {
        return indexPath.row == numberOfRowsInSection - 1
    }
}
