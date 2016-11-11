/*:
 # Selector
Selector is Objective-C term, Using selector in pure swift, we need @objc attibution to expose Swift api to Objective-C
 */

import UIKit
import Foundation

class Dog {
    
    @objc func say() {
    }
    
    @objc func say(text: String) {
        print("hi")
    }
}

let sel1 = #selector(Dog.say as (Dog) -> () -> Void)
let sel2 = #selector(Dog.say(text:) as (Dog)->(String) -> Void)


//: Using selector in Swift to access Objective-C property's getter and setter
class Cat : NSObject {
    var name: String?
}

let getName = #selector(getter: Cat.name)
let setName = #selector(setter: Cat.name)

let cat = Cat()

cat.perform(setName, with: "Kity")
let name = cat.perform(getName).takeUnretainedValue() as! String
print(name) //Kity


//: Using extra extension to make your code more native, and save your fingers.
class ViewController: UIViewController {
    
    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn.addTarget(self, action: .btnTapped, for: .touchUpInside)
    }
    
    func btnTapped(btn: UIButton) {
        
    }
}

private extension Selector {
    static let btnTapped = #selector(ViewController.btnTapped(btn:))
}
