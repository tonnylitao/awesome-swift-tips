//: [Previous](@previous)

import Foundation

var city: String? = "Auckland"
var para: [String: Any]! = [:]

if city != nil {
    para["city"] = city
}

// elimnate if with flatMap

city.flatMap { para["city"] = $0 }

// it is same as

city.flatMap { c -> Void? in
    para["city"] = c
    
    return ()
}

//: [Next](@next)
