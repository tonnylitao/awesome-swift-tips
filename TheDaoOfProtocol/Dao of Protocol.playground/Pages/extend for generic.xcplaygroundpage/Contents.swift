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
        print("calling string phone:", phone, terminator: "\n")
    }
}

struct Student: Callable {
    var phone: Int
    
    //use the default call()
}

////////////////////////////

extension Callable where Self.PhoneNumberType == Int {
    
    func call() {
        
        var phone = String(describing: self.phone)
        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: String.IndexDistance(3)))
        phone.insert("-", at: phone.index(phone.startIndex, offsetBy: String.IndexDistance(7)))
        
        print("calling int phone:", phone, terminator: "\n")
    }
    
}

let steve = Professor(phone: "1234567890")
steve.call()

let tim = Student(phone: 9876543210)
tim.call()

