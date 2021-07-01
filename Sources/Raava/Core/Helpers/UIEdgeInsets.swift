//
//  File.swift
//  
//
//  Created by Özgür Ersöz on 2021-05-31.
//

import Foundation
import UIKit


public extension UIEdgeInsets {
    static func padding(
        top: CGFloat = 0,
        left: CGFloat = 0,
        bottom: CGFloat = 0,
        right: CGFloat = 0
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
