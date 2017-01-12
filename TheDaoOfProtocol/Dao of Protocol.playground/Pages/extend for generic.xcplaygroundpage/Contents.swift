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
    
    //use the default call()
}

////////////////////////////

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

