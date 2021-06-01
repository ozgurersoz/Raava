//
//  File.swift
//  
//
//  Created by Özgur Ersöz on 2021-05-31.
//

import Foundation
import UIKit

@resultBuilder
public struct ScrollViewBuilder {
    
    public static func buildEither(first component: UIStackView) -> UIStackView {
        component
    }
    
    public static func buildEither(second component: UIStackView) -> UIStackView {
        component
    }
    
    public static func buildBlock(_ components: ViewBuilderProtocol...) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.keyboardDismissMode = .onDrag
        for var viewBuilder in components {
            viewBuilder.buildableView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(viewBuilder.buildableView)
            viewBuilder.buildableSuperView = scrollView
        }

        return scrollView
    }

}

public class ScrollableContent: ViewBuilderProtocol {
    var scrollView = UIScrollView()
    
    public var buildableSuperView: UIView?
    public var buildableView: UIView
    
    public init(
        @ScrollViewBuilder _ content: () -> UIScrollView
    ) {
        scrollView = content()
        buildableView = scrollView
    }
    
    public func build(on superview: inout UIView) -> Self {
        self.buildableSuperView = superview
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        superview.addSubview(scrollView)
        return self
    }
    
    public func addConstraints(_ handler: (UIView) -> Void) {
        handler(scrollView)
    }
    
    public func assign(to view: inout UIView) -> Self {
        view = buildableView
        return self
    }
    
    
}

