//
//  File.swift
//  
//
//  Created by Özgur Ersöz on 2021-05-25.
//

import UIKit
import Combine

public final class Spacing: UIView {
    
    public var constantValue: CGFloat? {
        willSet {
            guard let constant = newValue else { return }
            self.constraintAnchor?.constant = constant
        }
    }
    
    private var constraintAnchor: NSLayoutConstraint?
    private var cancellables: Set<AnyCancellable> = []
    public init(horizontal: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        constraintAnchor = widthAnchor.constraint(equalToConstant: horizontal)
        constraintAnchor?.isActive = true
    }
    
    public init(vertical: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        constraintAnchor = heightAnchor.constraint(equalToConstant: vertical)
        constraintAnchor?.isActive = true
    }
    
    @discardableResult
    public func assign(to view: inout Spacing?) -> Self {
        view = self
        return self
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}
