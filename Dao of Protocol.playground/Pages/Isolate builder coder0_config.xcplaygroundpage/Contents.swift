//: [Previous](@previous)

import Foundation
import UIKit

//The Dao of Protocol Extensions in Swift Part 1

//: keep self-contained
/*
 Most of us probably have known how to use self-run closure to help initializing property and keep related code self-contained.
 */

class MyViewController: UIViewController {
    
    lazy var lbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Hello World"
        lbl.backgroundColor = .gray
        return lbl
    }()
}

/*
 another example with builder
 */

extension UIViewController {
    
    public func build<T: UIView>(_ type : T.Type, closure: (T) -> Void) -> T {
        let obj = type.init()
        closure(obj)
        return obj
    }
}

class MyNewViewController: UIViewController {
    
    lazy var configedLbl = build(UILabel.self) {
        $0.frame = CGRect(x: 10, y: 10, width: 100, height: 10)
        $0.text = "Hello World"
        $0.backgroundColor = .gray
    }
    
}
