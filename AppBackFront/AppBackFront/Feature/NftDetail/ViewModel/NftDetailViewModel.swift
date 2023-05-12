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
        return 1
    }
    
    public var nftImage: String {
        return nft.nftImage ?? ""
    }
}
