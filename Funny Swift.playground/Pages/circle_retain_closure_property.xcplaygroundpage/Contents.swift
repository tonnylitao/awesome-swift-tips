//: [Previous](@previous)

//: Avoid circle retained in lazy

import Foundation

class Person {
    var name: String?
    
    lazy var say: () -> String = {
        [unowned self] in //try to delete this line
        
        print(self.name as Any) //circle retained
        
        return ""
    }
    
    deinit {
        print("deinit")
    }
}

Person().say

