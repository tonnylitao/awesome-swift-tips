import Foundation

@objc protocol MyProtocol {
    @objc optional func foo() -> String
}

class MyClass: MyProtocol {
    
}

//struct, enum canot use optional protocol
