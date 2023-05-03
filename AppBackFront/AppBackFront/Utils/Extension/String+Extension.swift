//
//  String+Extension.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 02/05/23.
//

import Foundation

public enum ValidType {
    case email
    case password
}

extension String {
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = ".{6,}"  // Mínimo de 6 caracteres
    }
    
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .email:
            regex = Regex.email.rawValue  // fazemos a validação de email
        case .password:
            regex = Regex.password.rawValue  // // fazemos a validação de password
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
