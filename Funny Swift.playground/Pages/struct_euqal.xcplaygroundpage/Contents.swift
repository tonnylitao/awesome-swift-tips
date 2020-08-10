import Foundation

struct A: Equatable {
    var name = ""
}

let a = A()

let b = a

if a == b {
    print("equal")
}
