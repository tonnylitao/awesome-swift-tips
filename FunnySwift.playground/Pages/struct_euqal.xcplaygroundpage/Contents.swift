import Foundation

struct A: Equatable {
    var name = ""
    
    static func ==(lhs: A, rhs: A) -> Bool {
        return lhs.name == rhs.name
    }
}

let a = A()

let b = a

if a == b {
    print("==")
}
