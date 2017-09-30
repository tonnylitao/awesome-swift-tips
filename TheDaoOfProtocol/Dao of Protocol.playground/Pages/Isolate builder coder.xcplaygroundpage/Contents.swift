import Foundation
import UIKit

//////////////////////////////////////////////////////////

protocol Dao {}
extension NSObject: Dao {}

//////////////////////////////////////////////////////////

extension Dao where Self : NSObject {
    
    typealias ConfigClosure = (Self) -> Void
    
    init(_ closures: ConfigClosure...) {
        self.init()
        
        closures.forEach {
            $0(self)
        }
    }
    
}

//////////////////////////////////////////////////////////
//take use of convenience initializer
extension Dao where Self : UIButton {
    
    init(type: UIButtonType, closure: (Self) -> Void) {
        self = UIButton(type: type) as! Self
        closure(self)
    }
}


//////////////////////////////////////////////////////////
let btn = UIButton() {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
}
print(btn)

//or
let simplifyBtn = UIButton {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
}
print(simplifyBtn)


let dic = NSMutableDictionary {
    $0["key"] = 10
}

let typedBtn = UIButton(type: .contactAdd) {
    $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
    $0.backgroundColor = .red
}

let b = UIButton({
    $0.backgroundColor = .red
},{
    $0.setTitle("Hello", for: .normal)
})



