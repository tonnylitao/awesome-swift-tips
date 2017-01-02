//: [Previous](@previous)

import Foundation

protocol Callable {
    associatedtype PhoneNumberType
    var phone: PhoneNumberType { get set }
}

extension Callable {
    func call() {  //Default implementation
        print(phone)
    }
}

struct Professor: Callable {
    var phone: String
    
//    func call() {  //Custom implementation
//        print(phone, phone)
//    }
}

struct Student: Callable {
    var phone: Int
}

//////////////////////////////////////////////////////////////////////////////////////

let steve = Professor(phone: "1234567890")
let tim = Student(phone: 9876543210)

extension Callable where Self.PhoneNumberType : SignedInteger {
    
    func call() {
        
        var phone = String(describing: self.phone)
        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: String.IndexDistance(3)))
        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: String.IndexDistance(7)))
        
        print(phone)
    }
    
}

steve.call()
tim.call()


//////////////////////////////////////////////////////////////////////////////////////

func call<T: Callable>(_ callee: T) {
    print(callee.phone)
}

func call<T: Callable>(_ callee: T) where T.PhoneNumberType: SignedInteger {
    
    var phone = String(describing: callee.phone)
    phone.insert("-", at: phone.index(phone.startIndex, offsetBy: String.IndexDistance(3)))
    phone.insert("-", at: phone.index(phone.startIndex, offsetBy: String.IndexDistance(7)))
    
    print(phone)
}

//func call(callee: Callable) { //Error
//    print("Phoning \(callee.phone)")
//}

call(steve)
call(tim)

