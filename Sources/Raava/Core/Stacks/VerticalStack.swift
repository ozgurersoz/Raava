//
//  File.swift
//  
//
//  Created by Özgur Ersöz on 2021-05-25.
//

import UIKit

@resultBuilder
public struct VerticalStackViewBuilder {
    
    public static func buildEither(first component: UIStackView) -> UIStackView {
        component
    }
    
    public static func buildEither(second component: UIStackView) -> UIStackView {
        component
    }
    
    public static func buildBlock(_ components: ViewBuilderProtocol...) -> UIStackView {
        let newView = UIStackView()
        newView.axis = .vertical
        for viewBuilder in components {
            viewBuilder.buildableView.translatesAutoresizingMaskIntoConstraints = false
            newView.addArrangedSubview(viewBuilder.buildableView)
        }

        return newView
    }
    
}

public class VerticalStack: ViewBuilderProtocol {
    let stackView: UIStackView
    
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
        margins: UIEdgeInsets? = nil,
        @VerticalStackViewBuilder _ content: () -> UIStackView
    ) {
        stackView = content()
        stackView.alignment = alignment
        stackView.distribution = distribution
        if let margins = margins {
            stackView.layoutMargins = margins
            stackView.isLayoutMarginsRelativeArrangement = true
        }
        buildableView = stackView
    }

    
    public func build(on superview: UIView) -> Self {
        self.buildableSuperView = superview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        buildableSuperView?.addSubview(stackView)
        return self
    }
    
    @discardableResult
    public func addConstraints(_ handler: @escaping (UIView, _ parentView: UIView) -> Void) -> Self {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        constraintsHandler = { own, parent in
            handler(own, parent)
        }
        return self
    }
    
    public func assign(to view: inout UIView) -> Self {
        view = buildableView
        return self
    }
}

