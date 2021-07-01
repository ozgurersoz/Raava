//
//  File.swift
//  
//
//  Created by Özgur Ersöz on 2021-05-25.
//

import Foundation
import UIKit

public extension UIView {
    @discardableResult
    func addConstraints(_ constraintHandler: (UIView) -> Void) -> ViewBuilderProtocol {
        constraintHandler(self)
        return self
    }
    
    @discardableResult
    func addConstraints(_ constraintHandler: (_ own: UIView, _ superview: UIView?) -> Void) -> ViewBuilderProtocol {
        constraintHandler(self, superview)
        return self
    }
    
}

