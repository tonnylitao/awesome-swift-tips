import Foundation

//: optional pattern

let option: Int? = 21

if case .some(let x) = option {
    print(x)
}

if case let x? = option {
    print(x)
}

let options: [Int?] = [1, 3, nil]
for case let x? in options {
    print(x)
}

//: optional pattern

enum Pet {
    case dog(String)
    case cat(Int)
}

let d = Pet.dog("Hell")

if case .dog(let x) = d {
    print(x)
}
