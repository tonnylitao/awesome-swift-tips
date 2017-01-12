//: [Previous](@previous)

import Foundation

protocol Callable {
    associatedtype PhoneNumberType
    var phone: PhoneNumberType { get set }
}

extension Callable {
    
    //default implementation
    func call() {
        print("calling", phone)
    }
}

struct Professor: Callable {
    var phone: String
    
    //'overwrite' implementation
    func call() {
        print("calling professor", phone)
    }
}

struct Student: Callable {
    var phone: Int
}

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

let steve = Professor(phone: "1234567890")
let tim = Student(phone: 9876543210)

call(steve)
call(tim)

