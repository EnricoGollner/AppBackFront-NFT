//
//  HomeService.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 03/05/23.
//

import UIKit
import Alamofire

protocol HomeServiceDelegate: GenericService {
    func getHomeFromJSON(completion: @escaping completion<NFTData?>)  // sendo: (_ result: T, _ failure: Error?) -> Void
    func getHome(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate {
    
    func getHome(completion: @escaping completion<NFTData?>) {
        let url: String = "https://run.mocky.io/v3/0ed87de7-90ea-4962-bf7d-bbe84391ebc1"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) { response in
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("FAILURE -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getHomeFromJSON(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData = try JSONDecoder().decode(NFTData.self, from: data)
                
                completion(nftData, nil)
            } catch {
                completion(nil, Error.fileDecodingFailed(name: "HomeData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
    }
    
}
