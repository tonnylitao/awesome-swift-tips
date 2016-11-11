import Foundation

enum IntOrString {
    case intValue(Int)
    case stringValue(String)
}

let arr = [IntOrString.intValue(1), IntOrString.stringValue("text")]

//: convert from literal types

extension IntOrString: ExpressibleByIntegerLiteral {
    init(integerLiteral value: Int) {
        self = .intValue(value)
    }
}

extension IntOrString: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        self = .stringValue(value)
    }
    
    init(extendedGraphemeClusterLiteral value: String) {
        self = .stringValue(value)
    }
    
    
    init(unicodeScalarLiteral value: String) {
        self = .stringValue(value)
    }
    
}

let mixed: [IntOrString] = [1, "text"]

