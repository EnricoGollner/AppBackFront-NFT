//
//  UIView+Extension.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 13/05/23.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(cornerRadius: Double,typeCorners: CACornerMask){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
    }
}
