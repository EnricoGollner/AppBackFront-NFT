//
//  GenericService.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 03/05/23.
//

import Foundation
import Alamofire

enum Error: Swift.Error {  // Como se fosse um error handler
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}

enum TypeFetch {
    case mock
    case request
}

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
