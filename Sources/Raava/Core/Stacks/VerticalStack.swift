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
        for var viewBuilder in components {
            viewBuilder.buildableView.translatesAutoresizingMaskIntoConstraints = false
            newView.addArrangedSubview(viewBuilder.buildableView)
            viewBuilder.buildableSuperView = newView
        }

        return newView
    }
    
    public static func buildArray(_ components: [ViewBuilderProtocol]) -> UIStackView {
        let newView = UIStackView()
        newView.axis = .vertical
        for var viewBuilder in components {
            viewBuilder.buildableView.translatesAutoresizingMaskIntoConstraints = false
            newView.addArrangedSubview(viewBuilder.buildableView)
            viewBuilder.buildableSuperView = newView
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
        spacing: CGFloat = 0,
        _ padding: UIEdgeInsets? = nil,
        @VerticalStackViewBuilder _ content: () -> UIStackView
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
        self.buildableSuperView = superview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        buildableSuperView?.addSubview(stackView)
        return self
    }
    
    @discardableResult
    public func addConstraints(_ handler: @escaping (UIView, _ parentView: UIView) -> Void) -> Self {
        if let parent = buildableSuperView {
            handler(stackView, parent)
        } else {
            constraintsHandler = { own, parent in
                handler(own, parent)
            }
        }
        return self
    }
    
    @discardableResult
    public func assign(to view: inout UIStackView) -> Self {
        view = stackView
        return self
    }
    
    @discardableResult
    public func pinToEdges(_ padding: CGFloat = 0) -> Self {
        if let parent = buildableSuperView {
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: padding),
                stackView.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: padding),
                stackView.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -padding),
                stackView.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -padding),
            ])
        }
        
        return self
    }
    
    @discardableResult
    public func remove(_ handle: () -> Void) -> Self {
        stackView.removeConstraints(stackView.constraints)
        stackView.removeFromSuperview()
        return self
    }
    
    @discardableResult
    public func padding() -> Self {
        
        return self
    }
    
    public func setHidden(_ hidden: Bool) {
        stackView.isHidden = hidden
    }
    
    
    public func assign(to view: inout UIView) -> Self { return self }
}

