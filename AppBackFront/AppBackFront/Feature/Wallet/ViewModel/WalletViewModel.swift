//
//  WalletViewModel.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 15/05/23.
//

import UIKit

class WalletViewModel {
    
    private let service: WalletService = WalletService()
    
    public func fetch(_ type: TypeFetch) {
        switch type {
        case .mock:
            service.getWalletFromJSON { result, failure in
                print(result)
            }
        case .request:
            service.getWallet { result, failure in
                print(result)
            }
        }
    }
    
}
