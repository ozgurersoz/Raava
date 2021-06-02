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

        for var viewBuilder in components {
            viewBuilder.buildableView.translatesAutoresizingMaskIntoConstraints = false
            newView.addArrangedSubview(viewBuilder.buildableView)
            viewBuilder.buildableSuperView = newView
        }
        
        return newView
    }
    
}

public class HorizontalStack: ViewBuilderProtocol {
    var stackView: UIStackView
    
    public var buildableSuperView: UIView? {
        willSet {
            if let parentView = newValue {
                constraintsHandler?(buildableView, parentView)
            }
        }
    }
    public var buildableView: UIView
    private var constraintsHandler: ((_ own: UIView, _ parent: UIView) -> Void)?
    
    public init(
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill,
        spacing: CGFloat = 0,
        _ padding: UIEdgeInsets? = nil,
        @HorizontalStackViewBuilder _ content: () -> UIStackView
    ) {
        
        stackView = content()
        stackView.alignment = alignment
        stackView.distribution = distribution
        stackView.spacing = spacing
        if let padding = padding {
            stackView.layoutMargins = padding
            stackView.isLayoutMarginsRelativeArrangement = true
        }
        buildableView = stackView
    }
    
    public func build(on superview: UIView) -> Self {
        buildableSuperView = superview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        buildableSuperView?.addSubview(stackView)
        return self
    }
    
    @discardableResult
    public func addConstraints(_ handler: @escaping (UIView, _ parentView: UIView) -> Void) -> Self {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        if let parent = buildableSuperView {
            handler(stackView, parent)
        } else {
            constraintsHandler = { own, parent in
                handler(own, parent)
            }
        }
        return self
    }
    
    public func assign(to view: inout UIView) -> Self {
        view = buildableView
        return self
    }
}
