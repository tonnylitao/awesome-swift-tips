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
 Let's move a little forward. Type inference is Swift natural ability, and thanks for it, developer just need input type only once in most places. And here, how about eliminate the extra declaration of UILabel?
 From NSHipster, I learned a useful public function. And I improve it slightly (Maybe you disagree).
 */

public func build<T: UIView>(_ type : T.Type, closure: (T) -> Void) -> T
{
    let obj = type.init()
    closure(obj)
    return obj
}

class MyNewViewController: UIViewController {
    
    lazy var configedLbl = build(UILabel.self) {
        $0.frame = CGRect(x: 10, y: 10, width: 100, height: 10)
        $0.text = "Hello World"
        $0.backgroundColor = .gray
    }
    
}

/* 👍It's great, but I should never stop think forward. After many years coding, I've became addicted into those massive utilities with inertia. But another man in brain tell me it's not elegant. Why copy so many thinkings from C without second thoughts? After all Swift has tons of wonderful language features, such as extension and protocol. Why not swift natively.😎
*/
