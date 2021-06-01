//
//  File.swift
//  
//
//  Created by Özgur Ersöz on 2021-05-31.
//

import Foundation
import UIKit

@resultBuilder
public struct HorizontalStackViewBuilder {
    
    public static func buildEither(first component: UIStackView) -> UIStackView {
        component
    }
    
    public static func buildEither(second component: UIStackView) -> UIStackView {
        component
    }
    
    public static func buildBlock(_ components: ViewBuilderProtocol...) -> UIStackView {
        let newView = UIStackView()
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.alignment = .fill
        newView.distribution = .fill
        newView.axis = .horizontal

        for viewBuilder in components {
            viewBuilder.buildableView.translatesAutoresizingMaskIntoConstraints = false
            newView.addArrangedSubview(viewBuilder.buildableView)
        }
        
        return newView
    }
    
}

public class HorizontalStack: ViewBuilderProtocol {
    var stackView: UIStackView
    
    public var buildableSuperView: UIView?
    
    public var buildableView: UIView
    
    public init(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        _ padding: UIEdgeInsets? = nil,
        @HorizontalStackViewBuilder _ content: () -> UIStackView
    ) {
        
        stackView = content()
        stackView.alignment = alignment
        stackView.distribution = distribution
        if let padding = padding {
            stackView.layoutMargins = padding
            stackView.isLayoutMarginsRelativeArrangement = true
        }
        buildableView = stackView
    }
    
    public func build(on superview: inout UIView) -> Self {
        buildableSuperView = superview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        buildableSuperView?.addSubview(stackView)
        return self
    }
    
    @discardableResult
    public func addConstraints(_ handler: (UIView) -> Void) -> Self {
        stackView.addConstraints(handler)
        return self
    }
    
    public func assign(to view: inout UIView) -> Self {
        view = buildableView
        return self
    }
}
