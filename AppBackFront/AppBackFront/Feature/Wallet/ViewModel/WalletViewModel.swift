//
//  WalletViewModel.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 15/05/23.
//

import UIKit

protocol WalletViewModelDelegate: AnyObject {
    func success()
    func error()
}

class WalletViewModel {
    
    private let service: WalletService = WalletService()
    private weak var delegate: WalletViewModelDelegate?
    private var walletData: WalletData?
    
    public func delegate(delegate: WalletViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetch(_ type: TypeFetch) {
        switch type {
        case .mock:
            service.getWalletFromJSON { result, failure in
                if let result {
                    self.walletData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error()
                }
            }
        case .request:
            service.getWallet { result, failure in
                if let result {
                    self.walletData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.error()
                }
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return 2
    }
    
    public var quotationEthereum: QuotationEthereum {
        return walletData?.quotationEthereum ?? QuotationEthereum()
    }
    
    public func heightForRow(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            return 250
        case .transactionList:
            return HeightLatestTransactions.height.rawValue * CGFloat(walletData?.latestTransactionsCell?.listOfTransactions?.count ?? 0) + 75
        default:
            return 0
        }
    }
    
    public var latestTransactionCell: LatestTransactionsCell {
        return walletData?.latestTransactionsCell ?? LatestTransactionsCell()
    }
    
}
