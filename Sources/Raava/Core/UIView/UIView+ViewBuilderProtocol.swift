//
//  File.swift
//  
//
//  Created by Özgur Ersöz on 2021-05-25.
//

import UIKit

extension UIView: ViewBuilderProtocol {
    public var buildableSuperView: UIView? {
        get { superview }
        set {}
    }

    public var buildableView: UIView {
        return self
    }
    
    @discardableResult
    public func assign(to view: inout UIView) -> Self {
        view = self
        return self
    }    
}
