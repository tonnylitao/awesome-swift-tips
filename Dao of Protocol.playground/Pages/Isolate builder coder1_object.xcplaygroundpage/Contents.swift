//: [Previous](@previous)

import Foundation
import UIKit

//: So let's extend all objects, not just only UILabel.

extension NSObject {
    convenience init(closure: (NSObject) -> Void) {
        self.init()
        closure(self)
    }
}

let newLbl = UILabel { obj in
    let lbl = obj as! UILabel
    lbl.text = "World"
}

/*
 Ops, we have to use NSObject to replace 'Self' here, but lost the sub Type information. It's means we have to use the annoying as! or as? in next place. It's getting even worse.😰
 */
