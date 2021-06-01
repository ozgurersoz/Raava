//
//  File.swift
//  
//
//  Created by Özgur Ersöz on 2021-05-25.
//

import UIKit

public final class Spacing: UIView {
    
    public init(horizontal: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: horizontal).isActive = true
    }
    
    public init(vertical: CGFloat) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: vertical).isActive = true
    }
    
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}
