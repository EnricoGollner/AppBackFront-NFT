//
//  CACornerMask+Extension.swift
//  AppBackFront
//
//  Created by Enrico Sousa Gollner on 13/05/23.
//

import Foundation
import UIKit

extension CACornerMask {
    static public let bottomRight: CACornerMask = .layerMaxXMaxYCorner
    static public let bottomLeft: CACornerMask = .layerMinXMaxYCorner
    static public let topRight: CACornerMask = .layerMaxXMinYCorner
    static public let topLeft: CACornerMask = .layerMinXMinYCorner
}
