//
//  WalletService.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 15/05/23.
//

import Alamofire
import UIKit

protocol WalletServiceDelegate: GenericService {
    func getWalletFromJSON(completion: @escaping completion<WalletData?>)
    func getWallet(completion: @escaping completion<WalletData?>)
}

class WalletService: WalletServiceDelegate {
    
    func getWallet(completion: @escaping completion<WalletData?>) {
        let url: String = "https://run.mocky.io/v3/d1823d68-3355-4d53-8800-2a847b0af2e1"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: WalletData.self) { response in
            debugPrint(response)
            switch response.result {
            case .success(let success):
                completion(success, nil)
            case .failure(let error):
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getWalletFromJSON(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "WalletData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let result: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
                completion(result, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "WalletData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "WalletData"))
        }
    }
    
}
