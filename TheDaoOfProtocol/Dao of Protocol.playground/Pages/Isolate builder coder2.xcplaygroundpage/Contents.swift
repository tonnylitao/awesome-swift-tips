//: [Previous](@previous)

import Foundation
import UIKit

/*
 Extension conflicts with 'Self' when extending Entity, but you know Protocol in Swift welcomes 'Self'. I wish I'm the last person in the earth known it.
 
 In Chinese culture, Dao describes a fairyland where nothing is everything, everything is nothing. It's empty but rich, it's still but transformable.
 How about using Dao transform logic features into entities?
 */

protocol Dao {}

extension NSObject: Dao {}
extension Dao where Self : NSObject {
    
    init(closure: (Self) -> Void) {
        self.init()
        closure(self)
    }
}

let newWorldLbl = UILabel {
    $0.frame = CGRect(x: 10, y: 10, width: 100, height: 10)
    $0.text = "New World"
    $0.backgroundColor = .red
}

let view = UIView {
    $0.frame = CGRect(x: 10, y: 10, width: 100, height: 10)
    $0.backgroundColor = .red
}


let dic = NSMutableDictionary {
    $0["key"] = 10
}

/*
 Dao really works👏, but stop being visionary with Dao and face up to reality.
 */

let btn = UIButton {
//    $0.buttonType = .contactAdd
    
    $0.frame = CGRect(x: 10, y: 10, width: 100, height: 10)
    $0.backgroundColor = .red
}

/*
 Obviously, we lost UIButton(type:) convenience initializer. This world is extraordinarily complex, never under the delusion of done once and for ever. Let's try to use Dao again in sub-world of UIButton.
 */



