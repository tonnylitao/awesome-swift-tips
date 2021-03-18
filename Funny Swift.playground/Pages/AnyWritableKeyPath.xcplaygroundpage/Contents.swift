//: [Previous](@previous)

import Foundation

/*
 A programming paradigm in Swift to get rid of type erase
 
 let array: [Any] = [1, "1"] //type erased here
 let arrayWithType = [AnyWithType(1), AnyWithType("1")]
 
 struct AnyWithType {
    let closue = (Any) -> ()
 
    init<Type>(_ value: Type) {
        closue = {
            if let valueWithType = $0 as? Type {
                //type find back here
            }
        }
    }
 }
 */

struct AnyWritableKeyPath<Root> {
    
    let keyPath: PartialKeyPath<Root>
    
    let write: (inout Root, Any) -> ()
    
    init<Value>(_ keyPath: WritableKeyPath<Root, Value>) {
        self.keyPath = keyPath
        
        write = {
            if let value = $1 as? Value {
                $0[keyPath: keyPath] = value
            }else {
                assert(false, "type is not right \($1) \(Value.self)")
            }
        }
    }
}

prefix operator ^
prefix func ^ <Root, Value>(keyPath: WritableKeyPath<Root, Value>) -> AnyWritableKeyPath<Root> {
    return AnyWritableKeyPath<Root>(keyPath)
}


