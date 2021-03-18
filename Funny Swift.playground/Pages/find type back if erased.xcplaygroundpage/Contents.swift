//: [Previous](@previous)

import Foundation

public struct AnyEquatable {
    private let value: Any
    private let equals: (Any) -> Bool

    public init<T: Equatable>(_ value: T) {
        self.value = value
        self.equals = { ($0 as? T == value) }
    }
}

extension AnyEquatable: Equatable {
    static public func == (lhs: AnyEquatable, rhs: AnyEquatable) -> Bool {
        return lhs.equals(rhs.value)
    }
}

let anyArr: [Any] = [5, 5.0]

let w = AnyEquatable(5)
let x = AnyEquatable(5.0)
let y = AnyEquatable(6)
let z = AnyEquatable("Hello")

print(w == x, w == y, w == z)

let arr = [AnyEquatable(55), AnyEquatable("dog")]

print(arr.contains(AnyEquatable("dog")), arr.contains(AnyEquatable(10))) // -> true false

// Note that two values are only equal if they are the same type
print(AnyEquatable(5 as Int) == AnyEquatable(5 as Double)) // -> false

