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
    
//    static func padding(
//        _ padding: CGFloat
//    ) -> UIEdgeInsets {
//        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
//    }
//    
//    static func padding(
//        _ left: CGFloat
//    ) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
//    }
//    
//    static func padding(
//        _ right: CGFloat
//    ) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: right)
//    }
//    
//    static func padding(
//        _ bottom: CGFloat
//    ) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: bottom, right: 0)
//    }
}
