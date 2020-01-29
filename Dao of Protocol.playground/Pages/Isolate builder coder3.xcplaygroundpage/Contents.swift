//: [Previous](@previous)

import Foundation
import UIKit

//: Dao, Using protocol extension

protocol Dao {}

extension NSObject: Dao {}
extension Dao where Self : NSObject {
    
    init(closure: (Self) -> Void) {
        self.init()
        closure(self)
    }
}

let btn = UIButton() {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
}
print(btn)

//Here

extension Dao where Self : UIButton {
    
    init(type: UIButton.ButtonType, closure: (Self) -> Void) {
        self = UIButton(type: type) as! Self
        closure(self)
    }
}

let typedBtn = UIButton(type: .contactAdd) {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
}

print(typedBtn, typedBtn.buttonType.rawValue) //5 .contactAdd


/*
 By adding constraints to protocol extensions for UIButton sub-set of NSObject, it works. This feature seems damn useful. But be careful exceed too much to fire yourself.
 */

/*
 BTW, Thanks for the simplify of function calling. we successfully eliminate the () after UIButton. It's elegant, too much.
 
 */



let simplifyBtn = UIButton {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
}
print(simplifyBtn)



