//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 03/05/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func error()
}

class HomeViewModel {
    
    
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    weak private var delegate: HomeViewModelDelegate?
    
    public func delegate(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ type: TypeFetch) {
        
        switch type {
        case .mock:
            service.getHomeFromJSON { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()  // Assíncrona
                    print("SUCCESS -> \(#function)")
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()  // Assíncrona
                    print("SUCCES -> \(#function)")
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
    }
    
}
