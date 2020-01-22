import Foundation

// optional method in protocol works only with @objc

@objc protocol MyProtocol {
    @objc optional func foo() -> String
}

class MyClass: MyProtocol {
    
}

//but struct, enum canot use optional protocol
