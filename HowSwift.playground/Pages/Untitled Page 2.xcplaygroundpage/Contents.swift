//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

extension Dictionary {
    
    mutating func update(other: Dictionary) {
        
        for (key, value) in other {
            if (value as Optional) {
                self.updateValue(v, forKey:key)
            }
        }
    }
}



var d = ["a": "", "b": nil]

d.update(other: ["a": nil])

d