//
//  File.swift
//  
//
//  Created by Özgür Ersöz on 2021-05-31.
//

import SnapshotTesting
import XCTest
import UIKit
import Foundation
@testable import Raava

class SomeScreenSSTest: XCTestCase {
 
    func testTakeShot() {
        isRecording = true
        var view = UIView(frame: .init(x: 0, y: 0, width: 250, height: 500))
        view.backgroundColor = .white
        
        
        let square1 = UIView()
        square1.backgroundColor = .red
        
        let square2 = UIView()
        square2.backgroundColor = .blue
    
        let square3 = UIView()
        square3.backgroundColor = .gray
        
        let a = 2
        
        ScrollableContent {
            VerticalStack {
                HorizontalStack {
                    if a == 1 {
                        UILabel().title("gggg")
                        square1
                            .addConstraints {
                                $0.heightAnchor.constraint(equalToConstant: 60).isActive = true
                            }
                    } else {
                        UILabel().title("gggg")

                    }
                }
                HorizontalStack(alignment: .top) {
                    UIView()
                        .addConstraints {
                            $0.heightAnchor.constraint(equalToConstant: 100).isActive = true
                            $0.widthAnchor.constraint(equalToConstant: 100).isActive = true
                        }
                    VerticalStack() {
                        UILabel().title("This is")
                        UILabel().title("My framework")
                        UILabel().title("You bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good work You bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good workYou bitch!!!!!But it’s also good that you decide to change it when you are not happy - it would just be nice to change it together. Good work").numberOfLines(0)
                    }
                }
            }
            .addConstraints { own, parent in
                NSLayoutConstraint.activate([
                    own.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
                    own.widthAnchor.constraint(equalTo: parent.widthAnchor),
                    own.topAnchor.constraint(equalTo: parent.topAnchor),
                    own.heightAnchor.constraint(equalTo: parent.heightAnchor),
                ])
            }
        }
        .build(on: &view)
        .addConstraints { own in
            own.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            own.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            own.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            own.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        }

        assertSnapshot(matching: view, as: .image)
    }
}
