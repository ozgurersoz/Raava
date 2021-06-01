//
//  File.swift
//  
//
//  Created by Özgur Ersöz on 2021-05-31.
//

import UIKit

public protocol ViewBuilderProtocol {
    var buildableView: UIView { get }
    var buildableSuperView: UIView? { get set }
        
    func assign(to view: inout UIView) -> Self
}
