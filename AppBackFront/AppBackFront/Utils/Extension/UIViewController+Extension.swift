//
//  UIViewController+Extension.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 02/05/23.
//

import Foundation
import UIKit

extension UIViewController {
    func tapViewDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}


