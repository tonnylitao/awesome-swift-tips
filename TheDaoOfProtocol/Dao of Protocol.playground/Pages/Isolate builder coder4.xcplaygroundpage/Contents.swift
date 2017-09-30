//: [Previous](@previous)

import Foundation
import UIKit

//: Dao, Using variable parameters

/*
 Thank you scroll here patiently, but please don't close this page so quickly.
 Let's think forward once more. If you enjoy it, please give me a Star.
 */

protocol Dao {}

extension NSObject: Dao {}

extension Dao where Self : NSObject {
    
    typealias ConfigClosure = (Self) -> Void

    init(_ closures: ConfigClosure...) {
        self.init()
        
        closures.forEach {
            $0(self)
        }
    }
    
}

class MyViewController : UIViewController {

    lazy var creazyBtn = UIButton({
        print("setup property")
        $0.frame = CGRect(x: 10, y: 10, width: 44, height: 44)
        $0.backgroundColor = .red
        $0.clipsToBounds = true
        $0.alpha = 0.5
        $0.tintColor = .blue
    }, {
        print("setup layer")
        $0.layer.borderColor = UIColor.yellow.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = $0.bounds.width*0.5
    }, {
        print("setup action")
        $0.addTarget(UIViewController(), action: #selector(MyViewController.login(btn:)), for: .touchUpInside)
    })

    @objc func login(btn: UIButton) {
        print("login", terminator: "")
    }
    
}


/*
 Honestly, I refuse this coding style. Just a joke, have fun.
 Writing in earthquake. I'm fine, thanks.
 
 Cheers🍺
 Tonny seeking job in Wellington NZ. Maybe a share could help.
 */
