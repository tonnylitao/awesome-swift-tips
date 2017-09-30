//: [Previous](@previous)

//: Avoid circle retain

import Foundation

class Person {
    var name: String?
    
    lazy var say: () -> String = {
        [unowned self] in
        
        print(self.name as Any)
        
        return ""
    }
    
    deinit {
        print("deinit")
    }
}

Person().say

