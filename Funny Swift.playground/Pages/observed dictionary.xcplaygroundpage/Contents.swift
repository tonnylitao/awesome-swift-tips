//: [Previous](@previous)

import Foundation

struct ObservedDictionary<Key> where Key: Hashable {
    lazy private var items: [Key: Any] = [:]
    
    subscript(key: Key) -> Any? {
        mutating get{
            return items[key]
        }
        set(newValue) {
            items[key] = newValue
            print("set", key)
        }
    }
}

var items = ObservedDictionary<String>()
items["1"] = "A"
items["2"] = "B"


//: [Next](@next)
